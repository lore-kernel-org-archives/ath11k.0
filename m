Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvycX-0000tU-1B
 for ath11k@lists.infradead.org; Thu, 16 Jul 2020 07:47:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RESEND 2/2] ath11k: add debugfs for TWT debug calls
References: <20200624080321.2271943-1-john@phrozen.org>
 <20200624080321.2271943-2-john@phrozen.org>
Date: Thu, 16 Jul 2020 10:47:48 +0300
In-Reply-To: <20200624080321.2271943-2-john@phrozen.org> (John Crispin's
 message of "Wed, 24 Jun 2020 10:03:21 +0200")
Message-ID: <87tuy7x5nf.fsf@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

+ linux-wireless

John Crispin <john@phrozen.org> writes:

> These new debugfs files allow us to manually add/del/pause/resume TWT
> dialogs for test/debug purposes.
>
> The debugfs files expect the following parameters
> add_dialog      - mac dialog_id wake_intvl_us wake_intvl_mantis
>                   wake_dura_us sp_offset_us twt_cmd flag_bcast
>                   flag_trigger flag_flow_type flag_protection
> del_dialog      - mac dialog_id
> pause_dialog    - mac dialog_id
> resume_dialog   - mac dialog_id sp_offset_us next_twt_size

Full examples (including full path to the debugfs file) for some of
these would be nice, especially for add_dialog file.

Also please add Tested-on tag:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches#hardware_families

And Cc linux-wireless, otherwise patchwork won't see these.

BTW, I prefer to avoid using RESEND, REPOST etc. Increasing the version
number makes it easier to track patches, even if there are no changes
between versions.

> +static ssize_t ath11k_write_twt_add_dialog(struct file *file,
> +					   const char __user *ubuf,
> +					   size_t count, loff_t *ppos)
> +{
> +	struct ath11k_vif *arvif = file->private_data;
> +	struct wmi_twt_add_dialog_params params = { 0 };
> +	u8 buf[128] = {0};
> +	int ret;
> +
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
> +	if (ret < 0)
> +		return ret;
> +
> +	buf[ret] = '\0';
> +	ret = sscanf(buf, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u %u "
> +		     "%u %u %u %hhu %hhu %hhu %hhu %hhu",
> +		     &params.peer_macaddr[0],
> +		     &params.peer_macaddr[1],
> +		     &params.peer_macaddr[2],
> +		     &params.peer_macaddr[3],
> +		     &params.peer_macaddr[4],
> +		     &params.peer_macaddr[5],
> +		     &params.dialog_id,
> +		     &params.wake_intvl_us,
> +		     &params.wake_intvl_mantis,
> +		     &params.wake_dura_us,
> +		     &params.sp_offset_us,
> +		     &params.twt_cmd,
> +		     &params.flag_bcast,
> +		     &params.flag_trigger,
> +		     &params.flag_flow_type,
> +		     &params.flag_protection);
> +	if (ret != 16)
> +		return -EINVAL;
> +
> +	params.vdev_id = arvif->vdev_id;
> +
> +	ret = ath11k_wmi_send_twt_add_dialog_cmd(arvif->ar, &params);
> +
> +	return ret ? ret : count;

More lines but easier to read:

ret = foo();
if (ret)
        return ret;

return count;

> +static ssize_t ath11k_write_twt_del_dialog(struct file *file,
> +					   const char __user *ubuf,
> +					   size_t count, loff_t *ppos)
> +{
> +	struct ath11k_vif *arvif = file->private_data;
> +	struct wmi_twt_del_dialog_params params = { 0 };
> +	u8 buf[64] = {0};
> +	int ret;
> +
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
> +	if (ret < 0)
> +		return ret;
> +
> +	buf[ret] = '\0';
> +	ret = sscanf(buf, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u",
> +		     &params.peer_macaddr[0],
> +		     &params.peer_macaddr[1],
> +		     &params.peer_macaddr[2],
> +		     &params.peer_macaddr[3],
> +		     &params.peer_macaddr[4],
> +		     &params.peer_macaddr[5],
> +		     &params.dialog_id);
> +	if (ret != 7)
> +		return -EINVAL;
> +
> +	params.vdev_id = arvif->vdev_id;
> +
> +	ret = ath11k_wmi_send_twt_del_dialog_cmd(arvif->ar, &params);
> +
> +	return ret ? ret : count;
> +}

Ditto.

> +static ssize_t ath11k_write_twt_pause_dialog(struct file *file,
> +					     const char __user *ubuf,
> +					     size_t count, loff_t *ppos)
> +{
> +	struct ath11k_vif *arvif = file->private_data;
> +	struct wmi_twt_pause_dialog_params params = { 0 };
> +	u8 buf[64] = {0};
> +	int ret;
> +
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
> +	if (ret < 0)
> +		return ret;
> +
> +	buf[ret] = '\0';
> +	ret = sscanf(buf, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u",
> +		     &params.peer_macaddr[0],
> +		     &params.peer_macaddr[1],
> +		     &params.peer_macaddr[2],
> +		     &params.peer_macaddr[3],
> +		     &params.peer_macaddr[4],
> +		     &params.peer_macaddr[5],
> +		     &params.dialog_id);
> +	if (ret != 7)
> +		return -EINVAL;
> +
> +	params.vdev_id = arvif->vdev_id;
> +
> +	ret = ath11k_wmi_send_twt_pause_dialog_cmd(arvif->ar, &params);
> +
> +	return ret ? ret : count;

And here as well.

> +static ssize_t ath11k_write_twt_resume_dialog(struct file *file,
> +					      const char __user *ubuf,
> +					      size_t count, loff_t *ppos)
> +{
> +	struct ath11k_vif *arvif = file->private_data;
> +	struct wmi_twt_resume_dialog_params params = { 0 };
> +	u8 buf[64] = {0};
> +	int ret;
> +
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
> +	if (ret < 0)
> +		return ret;
> +	buf[ret] = '\0';
> +	ret = sscanf(buf, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u %u %u",
> +		     &params.peer_macaddr[0],
> +		     &params.peer_macaddr[1],
> +		     &params.peer_macaddr[2],
> +		     &params.peer_macaddr[3],
> +		     &params.peer_macaddr[4],
> +		     &params.peer_macaddr[5],
> +		     &params.dialog_id,
> +		     &params.sp_offset_us,
> +		     &params.next_twt_size);
> +	if (ret != 9)
> +		return -EINVAL;
> +
> +	params.vdev_id = arvif->vdev_id;
> +
> +	ret = ath11k_wmi_send_twt_resume_dialog_cmd(arvif->ar, &params);
> +
> +	return ret ? ret : count;

And here.

> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -2061,6 +2061,8 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>  			ath11k_wmi_send_twt_enable_cmd(ar, ar->pdev->pdev_id);
>  		else
>  			ath11k_wmi_send_twt_disable_cmd(ar, ar->pdev->pdev_id);
> +		if (vif->type == NL80211_IFTYPE_AP)
> +			ath11k_debugfs_twt(arvif, info->twt_requester);

To make this more generic can you call this
ath11k_debugs_add_interface() or something like that? Ah, but this is in
ath11k_mac_op_bss_info_changed(). Shouldn't it be in
ath11k_mac_op_add_interface()?

Hmm, I think I get now. You create the debugfs directory and files only
when twt is actually enabled, not when the interface is added. I have
concerns about files coming and going like that dynamically. Wouldn't it
be cleaner to create the directory and the files when the interface is
added? And just return a good error code if someone tries to use the
debugfs files when twt is disabled?

> @@ -4608,6 +4610,8 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
>  
>  	/* TODO: recal traffic pause state based on the available vdevs */
>  
> +	debugfs_remove_recursive(arvif->debugfs_twt);
> +	arvif->debugfs_twt = NULL;

And this could be ath11k_debug_remove_interface().

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
