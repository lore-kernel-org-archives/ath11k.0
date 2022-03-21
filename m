Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D0BC433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVGdTGqnGV4FpMJfcZtuXS6dkI15mREpN1u6F4X4mM8=; b=EH8g8iz5L1FiD2
	ZtmWK14neh3i6V820oox9snbbilGPkDNbUCe6ia2VnhK2NXYU+oo2JGvEThywiuZ6beuIDSabPtK0
	cZ5qXxKBXeQcZv9NT9KZW9RXtzm1yo4/9Nuin1LxJ5gcMt7h8ja9raNuXjQf/dsExGkdZmZc07J4T
	uy/9gy+yXK9Hv2BIKvPnUDFE34/XuJFT5htWLpsUp7bHe/yxDEXn/xrFVtuqDq9AYoP9Kb7lZjDno
	JAX4RECZvBo4V5fAomkuv58t/d+laFQSZxUIvwpruSP8Fw/rTHSdc1DIkvnHKAPFhUBp/I76+QXGP
	ytf2xNSvc0KKWpwtcP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWFMF-007LcH-Dx; Mon, 21 Mar 2022 10:33:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWFMC-007Lbv-8s
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 10:33:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D875A61359;
 Mon, 21 Mar 2022 10:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E7AC340E8;
 Mon, 21 Mar 2022 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647858827;
 bh=JzwYf4qi3jqHOtC1dcLE0Loyi01CQES8KWgUsJ3jSd0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=WvGZ9SyFzXS65SqaeACEZBpZZhM3dxBtc2furnYhhe6JgpmcMQTrD4jaeoVRtdeKe
 vLzemCWfoWa9i0aEtHOsXO67+skWTJFSlaYpq+4cC/XJ42utTwvH8xxFl5JIEza2A8
 j7eee0ixGI/aJyOdH/NNntbzqL8vbBz5CsAk7TrpABMIRLCT6PqyLFm3qe8zK/2zZk
 Hc7HM8x+fcR+5IO5jP9ZgBB0PoKqYR2lEzGx4bJbMYHlYhP8R1FlD+pQrjspZO0fwb
 /CRnVRBO0ndhEJUlEdEClXJY5JNoTI7YmH2J8M3w/UFP2y8yjYRYEga5uD4YNkYF/2
 qjGk9Nq5BwuXw==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] ath11k: add read variant from SMBIOS for download
 board data
References: <20220315104721.26649-1-quic_wgong@quicinc.com>
 <20220315104721.26649-3-quic_wgong@quicinc.com>
Date: Mon, 21 Mar 2022 12:33:44 +0200
In-Reply-To: <20220315104721.26649-3-quic_wgong@quicinc.com> (Wen Gong's
 message of "Tue, 15 Mar 2022 06:47:21 -0400")
Message-ID: <874k3roarb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_033348_397444_E8E1725A 
X-CRM114-Status: GOOD (  14.54  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> This is to read variant from SMBIOS such as read from DT, the variant
> string will be used to one part of string which used to search board
> data from board-2.bin.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

> +	/* Copy extension name without magic prefix */
> +	if (strscpy(ab->qmi.target.bdf_ext, smbios->bdf_ext + strlen(magic),
> +		    sizeof(ab->qmi.target.bdf_ext)) < 0) {
> +		ath11k_dbg(ab, ATH11K_DBG_BOOT,
> +			   "bdf variant string is longer than the buffer can accommodate\n");
> +		return;
> +	}

In the pending branch I changed this a bit to follow the style used in
ath11k:

@@ -548,8 +548,9 @@ static void ath11k_core_check_bdfext(const struct dmi_header *hdr, void *data)
        struct ath11k_base *ab = data;
        const char *magic = ATH11K_SMBIOS_BDF_EXT_MAGIC;
        struct ath11k_smbios_bdf *smbios = (struct ath11k_smbios_bdf *)hdr;
-       int i;
+       ssize_t copied;
        size_t len;
+       int i;
 
        if (ab->qmi.target.bdf_ext[0] != '\0')
                return;
@@ -587,8 +588,9 @@ static void ath11k_core_check_bdfext(const struct dmi_header *hdr, void *data)
        }
 
        /* Copy extension name without magic prefix */
-       if (strscpy(ab->qmi.target.bdf_ext, smbios->bdf_ext + strlen(magic),
-                   sizeof(ab->qmi.target.bdf_ext)) < 0) {
+       copied = strscpy(ab->qmi.target.bdf_ext, smbios->bdf_ext + strlen(magic),
+                        sizeof(ab->qmi.target.bdf_ext));
+       if (copied < 0) {
                ath11k_dbg(ab, ATH11K_DBG_BOOT,
                           "bdf variant string is longer than the buffer can accommodate\n");
                return;

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
