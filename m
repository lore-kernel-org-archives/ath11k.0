Return-Path: <SRS0=mtRf=IH=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3313C433E6
	for <ath11k@archiver.kernel.org>; Tue,  9 Mar 2021 11:00:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 200F66513A
	for <ath11k@archiver.kernel.org>; Tue,  9 Mar 2021 11:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 200F66513A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tILYXKQxXADnn+ofNBazYxo4YzBhTd11me/Q47Bof7c=; b=cb5iCeWutKBCeudj8f5JjI1Rh
	tigzeoW3t6DnxSNRIF7TPo2C64kOl0ALt/lv7bFTl/aDJB8RwoDrbJnX0ZPDsOg4mVwFe/iNWQaKJ
	vhMwXzftKqlytYc1ePkWvPXoG1oHMaTbQzXjsgm+aC9hgwthVFqvZLnmQhW9qhWS1fwSCH8uwM1NQ
	ACtuCLboi6L0e3NC6KaKWcKnFDqbTsNPKjqXTRzh/pN/W4CdmIru7q5VHP5oaWTQe6ovtONU914fZ
	XLdp3FTin+wp9RWbz9Lrt84tHW8sUmVDObmF3XvUw5TI6ePPdOxDc1rjjI9f4zV/fe+F5h9md8m/o
	WoF20ltNw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJa5l-004FVy-BA; Tue, 09 Mar 2021 10:59:57 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJa5b-004FUi-QH
 for ath11k@lists.infradead.org; Tue, 09 Mar 2021 10:59:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615287590; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=EkpYZux4lGjPJ0NFDAaNb4kp+mRV085n5TDuN1w/cWo=;
 b=alorIedarqv2tVbMlGThgCPuX0Hp3AQEssME6VykItJjiWXGTv6WK+VxBtZYUthxphQ84ISQ
 DGNTh4hFBPNCo9WXtESPuluUurSUVtPIqU8ZTOJjXC8VXP2sHR5V8Pl8yS50F9IB1TIsMIvA
 6sovmyckbHvdh+hDo3qLOAzfxek=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60475512106ec1d90699c214 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 10:59:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 48ED0C433C6; Tue,  9 Mar 2021 10:59:29 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 194E3C433CA;
 Tue,  9 Mar 2021 10:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 194E3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Aloka Dixit <alokad@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 John Crispin <john@phrozen.org>
Subject: Re: [PATCH V5 2/2] ath11k: add debugfs for TWT debug calls
References: <20210222192651.1782-1-alokad@codeaurora.org>
 <20210222192651.1782-3-alokad@codeaurora.org>
Date: Tue, 09 Mar 2021 12:59:25 +0200
In-Reply-To: <20210222192651.1782-3-alokad@codeaurora.org> (Aloka Dixit's
 message of "Mon, 22 Feb 2021 11:26:51 -0800")
Message-ID: <87o8fszj76.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_105952_495480_3085282F 
X-CRM114-Status: GOOD (  22.04  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Aloka Dixit <alokad@codeaurora.org> writes:

> From: John Crispin <john@phrozen.org>
>
> New debugfs files to manually add/delete/pause/resume TWT
> dialogs for test/debug purposes.
>
> The debugfs files expect the following parameters
> (1) Add dialog
> echo '<Peer_MAC> <Dialog_ID> <Wake_Interval_Usec> <Wake_Interval_Mantis>
> <Wake_Duration_Usec> <First_SP_Offset> <TWT_Command> <1:Broadcast /
> 0:Individual> <1:Triggered / 0:Untriggered> <1:Unannounced /
> 0:Announced> <1:Protected / 0:Unprotected>' >
> /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/twt/add_dialog
>
> Example (Non-triggered and un-announced):
> echo '00:03:7F:20:13:52 1 102400 100 30720 20480 4 0 0 1 0' >
> /sys/kernel/debug/ieee80211/phy0/netdev:wlan0/twt/add_dialog
>
> (2) Delete dialog
> echo '<Peer_MAC> <Dialog_ID>' >
> /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/twt/del_dialog
>
> (3) Pause dialog
> echo '<Peer_MAC> <Dialog_ID>' >
> /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/twt/pause_dialog
>
> (4) Resume dialog
> echo '<Peer_MAC> <Dialog_ID> <SP_Offset_Usec> <Next_TWT_Size>' >
> /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/twt/resume_dialog
>
> Example:
> echo '00:03:7F:20:13:52 1 2000000 3' >
> /sys/kernel/debug/ieee80211/phy0/netdev:wlan0/twt/resume_dialog
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Co-developed-by: Aloka Dixit <alokad@codeaurora.org>
> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/debug.c
> +++ b/drivers/net/wireless/ath/ath11k/debug.c
> @@ -104,3 +104,227 @@ void ath11k_dbg_dump(struct ath11k_base *ab,
>  EXPORT_SYMBOL(ath11k_dbg_dump);
>  
>  #endif /* CONFIG_ATH11K_DEBUG */
> +
> +#ifdef CONFIG_ATH11K_DEBUGFS
> +static ssize_t ath11k_write_twt_add_dialog(struct file *file,
> +					   const char __user *ubuf,
> +					   size_t count, loff_t *ppos)
> +{
> +	struct ath11k_vif *arvif = file->private_data;
> +	struct wmi_twt_add_dialog_params params = { 0 };
> +	u8 buf[128] = {0};
> +	int ret;
> +
> +	if (arvif->ar->twt_enabled == 0) {
> +		ath11k_err(arvif->ar->ab, "TWT support is not enabled\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
> +	if (ret < 0)
> +		return ret;
> +
> +	buf[ret] = '\0';
> +	ret = sscanf(buf,
> +		     "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u %u %u %u %u %hhu %hhu %hhu %hhu %hhu",
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
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t ath11k_write_twt_del_dialog(struct file *file,
> +					   const char __user *ubuf,
> +					   size_t count, loff_t *ppos)
> +{
> +	struct ath11k_vif *arvif = file->private_data;
> +	struct wmi_twt_del_dialog_params params = { 0 };
> +	u8 buf[64] = {0};
> +	int ret;
> +
> +	if (arvif->ar->twt_enabled == 0) {
> +		ath11k_err(arvif->ar->ab, "TWT support is not enabled\n");
> +		return -EOPNOTSUPP;
> +	}
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
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t ath11k_write_twt_pause_dialog(struct file *file,
> +					     const char __user *ubuf,
> +					     size_t count, loff_t *ppos)
> +{
> +	struct ath11k_vif *arvif = file->private_data;
> +	struct wmi_twt_pause_dialog_params params = { 0 };
> +	u8 buf[64] = {0};
> +	int ret;
> +
> +	if (arvif->ar->twt_enabled == 0) {
> +		ath11k_err(arvif->ar->ab, "TWT support is not enabled\n");
> +		return -EOPNOTSUPP;
> +	}
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
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t ath11k_write_twt_resume_dialog(struct file *file,
> +					      const char __user *ubuf,
> +					      size_t count, loff_t *ppos)
> +{
> +	struct ath11k_vif *arvif = file->private_data;
> +	struct wmi_twt_resume_dialog_params params = { 0 };
> +	u8 buf[64] = {0};
> +	int ret;
> +
> +	if (arvif->ar->twt_enabled == 0) {
> +		ath11k_err(arvif->ar->ab, "TWT support is not enabled\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
> +	if (ret < 0)
> +		return ret;
> +
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
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static const struct file_operations ath11k_fops_twt_add_dialog = {
> +	.write = ath11k_write_twt_add_dialog,
> +	.open = simple_open
> +};
> +
> +static const struct file_operations ath11k_fops_twt_del_dialog = {
> +	.write = ath11k_write_twt_del_dialog,
> +	.open = simple_open
> +};
> +
> +static const struct file_operations ath11k_fops_twt_pause_dialog = {
> +	.write = ath11k_write_twt_pause_dialog,
> +	.open = simple_open
> +};
> +
> +static const struct file_operations ath11k_fops_twt_resume_dialog = {
> +	.write = ath11k_write_twt_resume_dialog,
> +	.open = simple_open
> +};
> +
> +void ath11k_debugfs_add_interface(struct ath11k_vif *arvif)
> +{
> +	if (arvif->vif->type == NL80211_IFTYPE_AP && !arvif->debugfs_twt) {
> +		arvif->debugfs_twt = debugfs_create_dir("twt",
> +							arvif->vif->debugfs_dir);
> +		if (IS_ERR_OR_NULL(arvif->debugfs_twt)) {
> +			ath11k_warn(arvif->ar->ab,
> +				    "failed to create twt debugfs: %p\n",
> +				    arvif->debugfs_twt);
> +			arvif->debugfs_twt = NULL;
> +			return;
> +		}
> +
> +		debugfs_create_file("add_dialog", 0200, arvif->debugfs_twt,
> +				    arvif, &ath11k_fops_twt_add_dialog);
> +
> +		debugfs_create_file("del_dialog", 0200, arvif->debugfs_twt,
> +				    arvif, &ath11k_fops_twt_del_dialog);
> +
> +		debugfs_create_file("pause_dialog", 0200, arvif->debugfs_twt,
> +				    arvif, &ath11k_fops_twt_pause_dialog);
> +
> +		debugfs_create_file("resume_dialog", 0200, arvif->debugfs_twt,
> +				    arvif, &ath11k_fops_twt_resume_dialog);
> +	}
> +}
> +
> +void ath11k_debugfs_remove_interface(struct ath11k_vif *arvif)
> +{
> +	debugfs_remove_recursive(arvif->debugfs_twt);
> +	arvif->debugfs_twt = NULL;
> +}
> +
> +#endif /* CONFIG_ATH11K_DEBUGFS */

Shouldn't these functions be in debugfs.c?

> diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
> index 659a275e2eb3..2b41cefb68b5 100644
> --- a/drivers/net/wireless/ath/ath11k/debug.h
> +++ b/drivers/net/wireless/ath/ath11k/debug.h
> @@ -64,4 +64,17 @@ do {								\
>  		__ath11k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__);	\
>  } while (0)
>  
> +#ifdef CONFIG_ATH11K_DEBUGFS
> +void ath11k_debugfs_add_interface(struct ath11k_vif *arvif);
> +void ath11k_debugfs_remove_interface(struct ath11k_vif *arvif);
> +#else /* CONFIG_ATH11K_DEBUGFS */
> +static inline void ath11k_debugfs_add_interface(struct ath11k_vif *arvif)
> +{
> +}
> +
> +static inline void ath11k_debugfs_remove_interface(struct ath11k_vif *arvif)
> +{
> +}
> +#endif /* CONFIG_ATH11K_DEBUGFS */

And these in debugfs.h?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
