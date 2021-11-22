Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC68C433F5
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbGRJo+b1lGnhMjWDem/7iiHp63mnxMjNzpspvnKJ/c=; b=pi8ZPGfq+vVrE1
	PAEQ/POB6HU16yqbypi7/AXfXEETuA4VzMdvuKflyV4TBJH+K68jKgvtLG0oMmhAgtfuwB070g2U9
	KVNbaOjvlHBz06//IKoXwRslHnaP92A+DjygDEqH8vGREEPFCBAiYxKGiFVLRhleVNDtxoTOagjIy
	8MWujtqqg0xIDiH+wMbEU6KzSbyS8Cpew7nzEkGuZF4CvgJmvw28hLjcCd0yUJw5vReG0RYDZDVN5
	eKafVYZuAiZElJI3n/OmvVlQikaE+h7dMnLT3JLpXhYoMXknnV7pysW9bBt9o87/uKzZbjf2yrH+u
	zsiDob+ZVox7jiDROK6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpAGK-00Gqeo-KQ; Mon, 22 Nov 2021 14:25:40 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpAGH-00Gqcm-TE
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 14:25:39 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637591134; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=O5LEWHvlqelZZBsxlrDsi4+wwGGYq7RrqrTfQUl0ntM=;
 b=dT/ADiSQ4SU2nT6WYg/9DB2+Zm0nOVVYeeCSr6fvTQl7fA2KuGUZYepM9IOdjN0E8Uj4PWj1
 JH/c1VvFSDDwm00579OFOFg8JiLwW76VUw/srNSzcArMxDArg33VZDLlldeCzx6NoHjzgJnF
 IU9MFDLKTJmFajRA0vJrRpN5ZjA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 619ba85d6db8415cb7007f64 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 14:25:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 95A15C4338F; Mon, 22 Nov 2021 14:25:33 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 43DC3C4360D;
 Mon, 22 Nov 2021 14:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 43DC3C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] ath11k: add read variant from SMBIOS for download
 board data
References: <20211118100033.8384-1-quic_wgong@quicinc.com>
Date: Mon, 22 Nov 2021 16:25:29 +0200
In-Reply-To: <20211118100033.8384-1-quic_wgong@quicinc.com> (Wen Gong's
 message of "Thu, 18 Nov 2021 05:00:33 -0500")
Message-ID: <87o86c8dye.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_062538_026855_8D366660 
X-CRM114-Status: GOOD (  15.22  )
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
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

> +int ath11k_core_check_smbios(struct ath11k_base *ab)
> +{
> +	ab->qmi.target.bdf_ext[0] = '\0';
> +	dmi_walk(ath11k_core_check_bdfext, ab);

For consistency I added error handling for dmi_walk().

> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index bbfc10fd5c6d..b234514e7138 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -952,7 +952,18 @@ int ath11k_core_fetch_bdf(struct ath11k_base *ath11k,
>  			  struct ath11k_board_data *bd);
>  void ath11k_core_free_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd);
>  int ath11k_core_check_dt(struct ath11k_base *ath11k);
> +/* SMBIOS type containing Board Data File Name Extension */
> +#define ATH11K_SMBIOS_BDF_EXT_TYPE 0xF8
>  
> +/* SMBIOS type structure length (excluding strings-set) */
> +#define ATH11K_SMBIOS_BDF_EXT_LENGTH 0x9
> +
> +/* Offset pointing to Board Data File Name Extension */
> +#define ATH11K_SMBIOS_BDF_EXT_OFFSET 0x8
> +
> +/* The magic used by QCA spec */
> +#define ATH11K_SMBIOS_BDF_EXT_MAGIC "BDF_"
> +int ath11k_core_check_smbios(struct ath11k_base *ab);
>  void ath11k_core_halt(struct ath11k *ar);
>  int ath11k_core_resume(struct ath11k_base *ab);
>  int ath11k_core_suspend(struct ath11k_base *ab);

This was an awkward place for the defines, so I moved up in the file.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
