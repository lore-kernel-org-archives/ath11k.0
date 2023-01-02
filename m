Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B478C3DA7A
	for <ath11k@archiver.kernel.org>; Mon,  2 Jan 2023 15:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5LuptMvFQuLjr8gYOEG5VDBXm5fJJkmV1b8xVqiXo8=; b=i+YTYUjgVoAiV8
	ayvideKpzuqgACO5ot1SJ/uqF+hqIm1h4OWHEa9gdwbYPIZUyoY0Sk3aikWNZuH+dYNOUpNPmjvH3
	sJ4GiL+sge9XRF2ud6ts9Idm4UkEQ4hAyqPogNzvYHCR2Ki2rv67CVJM07wbPxajJBqVkdwjJoLyw
	hqV2MiSCQzIulpfnvJgPQ4aMB+hZEFgWa6xFChRYwQK4M7CAYRKFDBZe7BPBBCzEUpDbpBFAwzd2K
	eMJv4o3NbWvn4Wqs+x0uErmmotRoLchiseYLLjtPRs+hqKj4k99ybjFLA8HhyMCyStNWwDkOTgXck
	4FtLSZu/ImQh7acvtG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCMyv-00CNoE-Hv; Mon, 02 Jan 2023 15:44:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCMxy-00CN3u-2g
	for ath11k@lists.infradead.org; Mon, 02 Jan 2023 15:43:12 +0000
Received: by mail-pl1-x62e.google.com with SMTP id g16so20193681plq.12
        for <ath11k@lists.infradead.org>; Mon, 02 Jan 2023 07:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7Tc8KfqDA09CyJg53HDxe6+/CNGRAWMBOCQwnykW6E=;
        b=fLJFtdssIVPlLra0ywCOTyDjgvU1gJ+9VlPpgKu7F6mqcadDo2vU/E6dbiJuRe8kK3
         EQjuZM1kHqOWX20DmvNUh6yU56kuWyKg+WwMi+LZBBM62rSProIYgOxuPOKa0ui0CH4J
         pchuzU6moRHuXgUVQTr+qBdRl06cm+x+B8JKkPnat+MgpExl/6yMI3clDhFAO+gu/Il+
         JqbxVSVZFiPhzL+/TokFr1wx63pEFBhwP5sSaFk/Zc7ZmnXukI42mgvMtmXwmuHQP58Z
         /yrhY+/7C5l64sWC8F/j5VmeCB+oNpSdjx402JO01f5Zp6kj//R/wIRFQHjIWEpsxs4p
         6K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7Tc8KfqDA09CyJg53HDxe6+/CNGRAWMBOCQwnykW6E=;
        b=NSrnCHScPUx99t9RGXZUSFtvJQNzcZWmEIxpwRYFWU641lvY2OtrCnrhSROFo14CH4
         A7PP069ERfdKDypImH17K0gm9OYqCTavNEFSFJcXygMhKxZLpdl5nQ6dkuk9VTHBpLbL
         cz7FTEyt5O8O6CSjz2N9vTQpWnqMgBELoe5dXN0DxbJ1cuyF3JVMUx5SrmS4Uw/JsoBS
         FmBxiiTy9SPVWJpEnReey6q35aqqd/hoIJJqJ5rYwswCtBODYsfozGISNUE08WWkIu++
         UxZVe1aJZE0VXQJqeyYq4wDgRVN4XqTZKtss/9q+Va+mxQlAotN8yLr19pzkbAA5Ggl/
         SAnw==
X-Gm-Message-State: AFqh2kr+yHon+d2BvN0So5gc2fyItc/IuMkOvZZQUhNFBTiA0ZlY0YnO
	bbfrBEP5FgQRoJdbf1VpXQvGVxvdAuJW1R+QPSp6Jw==
X-Google-Smtp-Source: AMrXdXubp9c9+m3wlm4dSAPFgQrN9UipbkHooolUK3IQnTm9qQY7wYJsIvbC7PvyXyNG4bEFTzgoiL5YGe3Ol3sF7Vk=
X-Received: by 2002:a17:902:ebc9:b0:189:7372:144c with SMTP id
 p9-20020a170902ebc900b001897372144cmr2181735plg.106.1672674185948; Mon, 02
 Jan 2023 07:43:05 -0800 (PST)
MIME-Version: 1.0
References: <20221220121231.20120-1-kvalo@kernel.org>
In-Reply-To: <20221220121231.20120-1-kvalo@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 2 Jan 2023 16:42:55 +0100
Message-ID: <CA+HBbNGBKemtF9ZsFBFCe7_1eqMJ80QhEPCsinOJY2LQ4+tiFg@mail.gmail.com>
Subject: Re: [PATCH] ath11k: debugfs: fix to work with multiple PCI devices
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_074310_193007_60D5F124 
X-CRM114-Status: GOOD (  30.67  )
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

On Tue, Dec 20, 2022 at 1:16 PM Kalle Valo <kvalo@kernel.org> wrote:
>
> From: Kalle Valo <quic_kvalo@quicinc.com>
>
> ath11k fails to load if there are multiple ath11k PCI devices with same name:
>
>  ath11k_pci 0000:01:00.0: Hardware name qcn9074 hw1.0
>  debugfs: Directory 'ath11k' with parent '/' already present!
>  ath11k_pci 0000:01:00.0: failed to create ath11k debugfs
>  ath11k_pci 0000:01:00.0: failed to create soc core: -17
>  ath11k_pci 0000:01:00.0: failed to init core: -17
>  ath11k_pci: probe of 0000:01:00.0 failed with error -17
>
> Fix this by creating a directory for each ath11k device using schema
> <bus>-<devname>, for example "pci-0000:06:00.0". This directory created under
> the top-level ath11k directory, for example /sys/kernel/debug/ath11k.
>
> The reference to the toplevel ath11k directory is not stored anymore within ath11k, instead
> it's retrieved using debugfs_lookup(). If the directory does not exist it will
> be created. After the last directory from the ath11k directory is removed, for
> example when doing rmmod ath11k, the empty ath11k directory is left in place,
> it's a minor cosmetic issue anyway.
>
> Here's an example hierarchy with one WCN6855:
>
> ath11k
> `-- pci-0000:06:00.0
>     |-- mac0
>     |   |-- dfs_block_radar_events
>     |   |-- dfs_simulate_radar
>     |   |-- ext_rx_stats
>     |   |-- ext_tx_stats
>     |   |-- fw_dbglog_config
>     |   |-- fw_stats
>     |   |   |-- beacon_stats
>     |   |   |-- pdev_stats
>     |   |   `-- vdev_stats
>     |   |-- htt_stats
>     |   |-- htt_stats_reset
>     |   |-- htt_stats_type
>     |   `-- pktlog_filter
>     |-- simulate_fw_crash
>     `-- soc_dp_stats
>
> I didn't have a test setup where I could connect multiple ath11k devices to the
> same the host, so I have only tested this with one device.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9


I can confirm that this works on a combination of IPQ8074 with an
external QCN9074 radio which
would previously clash and error out, so:

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
Tested-by: Robert Marko <robert.marko@sartura.hr>

>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.h    |  1 -
>  drivers/net/wireless/ath/ath11k/debugfs.c | 48 +++++++++++++++++++----
>  2 files changed, 40 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index a8acb8b7b8d5..beb552108ac3 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -921,7 +921,6 @@ struct ath11k_base {
>         enum ath11k_dfs_region dfs_region;
>  #ifdef CONFIG_ATH11K_DEBUGFS
>         struct dentry *debugfs_soc;
> -       struct dentry *debugfs_ath11k;
>  #endif
>         struct ath11k_soc_dp_stats soc_stats;
>
> diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
> index ccdf3d5ba1ab..5bb6fd17fdf6 100644
> --- a/drivers/net/wireless/ath/ath11k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath11k/debugfs.c
> @@ -976,10 +976,6 @@ int ath11k_debugfs_pdev_create(struct ath11k_base *ab)
>         if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
>                 return 0;
>
> -       ab->debugfs_soc = debugfs_create_dir(ab->hw_params.name, ab->debugfs_ath11k);
> -       if (IS_ERR(ab->debugfs_soc))
> -               return PTR_ERR(ab->debugfs_soc);
> -
>         debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
>                             &fops_simulate_fw_crash);
>
> @@ -1001,15 +997,51 @@ void ath11k_debugfs_pdev_destroy(struct ath11k_base *ab)
>
>  int ath11k_debugfs_soc_create(struct ath11k_base *ab)
>  {
> -       ab->debugfs_ath11k = debugfs_create_dir("ath11k", NULL);
> +       struct dentry *root;
> +       bool dput_needed;
> +       char name[64];
> +       int ret;
> +
> +       root = debugfs_lookup("ath11k", NULL);
> +       if (!root) {
> +               root = debugfs_create_dir("ath11k", NULL);
> +               if (IS_ERR_OR_NULL(root))
> +                       return PTR_ERR(root);
> +
> +               dput_needed = false;
> +       } else {
> +               /* a dentry from lookup() needs dput() after we don't use it */
> +               dput_needed = true;
> +       }
> +
> +       scnprintf(name, sizeof(name), "%s-%s", ath11k_bus_str(ab->hif.bus),
> +                 dev_name(ab->dev));
> +
> +       ab->debugfs_soc = debugfs_create_dir(name, root);
> +       if (IS_ERR_OR_NULL(ab->debugfs_soc)) {
> +               ret = PTR_ERR(ab->debugfs_soc);
> +               goto out;
> +       }
> +
> +       ret = 0;
>
> -       return PTR_ERR_OR_ZERO(ab->debugfs_ath11k);
> +out:
> +       if (dput_needed)
> +               dput(root);
> +
> +       return ret;
>  }
>
>  void ath11k_debugfs_soc_destroy(struct ath11k_base *ab)
>  {
> -       debugfs_remove_recursive(ab->debugfs_ath11k);
> -       ab->debugfs_ath11k = NULL;
> +       debugfs_remove_recursive(ab->debugfs_soc);
> +       ab->debugfs_soc = NULL;
> +
> +       /* We are not removing ath11k directory on purpose, even if it
> +        * would be empty. This simplifies the directory handling and it's
> +        * a minor cosmetic issue to leave an empty ath11k directory to
> +        * debugfs.
> +        */
>  }
>  EXPORT_SYMBOL(ath11k_debugfs_soc_destroy);
>
>
> base-commit: 922932ca02191a390f7f52fb6e21c44b50e14025
> --
> 2.30.2
>
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
