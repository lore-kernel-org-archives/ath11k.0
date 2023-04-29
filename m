Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA35C7618E
	for <ath11k@archiver.kernel.org>; Sat, 29 Apr 2023 05:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsN9VNmFw1pVbdL6SnT3yOMHkckq7wdVPxg57PNHq8s=; b=OoOznsJmQvzlTd
	fdm6YC5puf7mo6B4Orli5B8nIjcrI4PqwtDk5r2SkQS9QfhkNMuSdz1N3I7b3x7+wvFYjykNTgsRD
	r21Qf94tC78rHCcSYBdWo7Tkb+96S+FXDrqEWRs0XuF+ZQr9vO6FgLppqh2AvduN9Jrxc6EwzMeaG
	emdwhlhHzxldY4MwTTS2K5HF3f0FoywwPr12FGe+v4GAwak34GJLDQChO9q1KsOsiTU9oKphRfVka
	Z+dmjpFcat3TzsZaWuLjRq7WBogUFreJwNL0QsGhP9nVNpHjg8ekeiSlPys+8oSNqerrxxSeFY73E
	A8vLcUqmJJgYQSS4NSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psdHL-00CHHJ-1q;
	Sat, 29 Apr 2023 05:37:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psdHJ-00CHGd-0h
	for ath11k@lists.infradead.org;
	Sat, 29 Apr 2023 05:37:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4E58061358;
	Sat, 29 Apr 2023 05:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F119C43445;
	Sat, 29 Apr 2023 05:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682746667;
	bh=KcRS/gSUxsdaEHHgcHS4mEbJp1Za+VdXFHnn97XmJA4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CcXINkHQdc/my3AWAk1Mwcc5+46F0VQHMzKEKYRnCGe1degcBR3qR6AH78YDk8n3U
	 +HpfZ3CLLefCRrv5xs5XCCPQiFAeqyb0X/pF1MTVheWrfU/MnaTLhoy3q8pyAr0R9L
	 qcMfRsb2D7aBRar5n0U+YXHvjXbROdFttCsctnLzdopMMfKAnyYEJlOkS52xg1sPZT
	 9/n3byJq5Z/3Zo9n9DlvglUCQlSqmMhRKUcP1FlHUjFe5qbfKF78+ZE1A38qEnNXbA
	 c1lgmWxoI4c5ynJO4BEc/k36D+/LADEfBnND8DmU/kw30uXwC+XINrvuUPqkZXw2e7
	 EgDJQDhaZ8bsA==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 4/7] wifi: ath11k: MBSSID parameter configuration in AP mode
References: <20230405221648.17950-1-quic_alokad@quicinc.com>
	<20230405221648.17950-5-quic_alokad@quicinc.com>
Date: Sat, 29 Apr 2023 08:37:40 +0300
In-Reply-To: <20230405221648.17950-5-quic_alokad@quicinc.com> (Aloka Dixit's
	message of "Wed, 5 Apr 2023 15:16:45 -0700")
Message-ID: <87leibqme3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_223749_291863_3424BE9B 
X-CRM114-Status: GOOD (  12.44  )
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

Aloka Dixit <quic_alokad@quicinc.com> writes:

> Include MBSSID parameters in WMI vdev up operation.
>
> Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
> Co-developed-by: John Crispin <john@phrozen.org>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---

[...]

> @@ -7153,8 +7161,13 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
>  			ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
>  				    ret);
>  
> +		if (arvif->vif->mbssid_tx_vif)
> +			tx_arvif = (struct ath11k_vif *)arvif->vif->mbssid_tx_vif->drv_priv;

This had a warning:

drivers/net/wireless/ath/ath11k/mac.c:7200: line length of 92 exceeds 90 columns

In the pending branch I fixed it like this:

--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7143,6 +7143,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 {
        struct ath11k_base *ab = ar->ab;
        struct ath11k_vif *arvif, *tx_arvif = NULL;
+       struct ieee80211_vif *mbssid_tx_vif;
        int ret;
        int i;
        bool monitor_vif = false;
@@ -7196,8 +7197,10 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
                        ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
                                    ret);
 
-               if (arvif->vif->mbssid_tx_vif)
-                       tx_arvif = (struct ath11k_vif *)arvif->vif->mbssid_tx_vif->drv_priv;
+               mbssid_tx_vif = arvif->vif->mbssid_tx_vif;
+               if (mbssid_tx_vif)
+                       tx_arvif = (struct ath11k_vif *)mbssid_tx_vif->drv_priv;
+
                ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
                                         arvif->bssid,
                                         tx_arvif ? tx_arvif->bssid : NULL,

Link to the commit:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c884238009e778a0c8202a5eb0a7f68b13200bde

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
