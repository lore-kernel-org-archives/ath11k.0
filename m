Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E33EC4332F
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D98F8615E1
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D98F8615E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F15AP2sI1gE52Zin+YjCmZcFVf93E3YZmZ22/mt24rk=; b=FwsEnD9wgJ/hqT
	5cd8X/EsnenvsnyoW78+tX7wfeLI6quGDqshtWF1UGeOSMHlnBb+NMSm5kjuheEzR/s8nJn6YEAhn
	8gVeg8C4j4J0S0FuEJpGbsxf9pf0kj/M5zcBQGDTbhdIuXY7cHBwflvEvW/+BPuGWJ3OybU3uvtI0
	LzooMTMq2KbXMHHMPPj7ILu4iGTSn8+xqL6KtBYF8bxEB7gBn+Jr/UMLU2+YhBEq6BqYLdVskXED2
	C8rJzYo6V7I7bIWg24s1qWdK6CB4o0rGniTvOs/nWyoJPimldCHpjLeLDmzsPvKpI71xZyaskQAFT
	ajP6WvR9DIcgSE1C+dzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYd9-00F0Zm-OR; Mon, 15 Nov 2021 09:50:27 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYCL-00Eu63-4L
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:22:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636968164; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=U62EmARxNR8KH+ktmhYEC9AhrDv5PTxIm7p0ahUtG9M=;
 b=UOhH6HJceRaLkAgWyqolYNl0WiX/yFWcwZnpZ4QB9pBYDvUzeQ0HL0H0IW9tAgSQtVUQHtpG
 vm/76uR97YszrehKjBQMCw2vwUDGX33T9FXYrYlHI2UBSpPuiRZJVIoT5060I9fb4Jb/dv1S
 0323fZ1ZydylfWerlm1ZpfZUBSo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 619226e34db423396696fb35 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:22:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E299DC4360D; Mon, 15 Nov 2021 09:22:43 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 15117C43460;
 Mon, 15 Nov 2021 09:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 15117C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v3 01/12] ath11k: disable unused CE8 interrupts for ipq8074
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1630560820-21905-2-git-send-email-ppranees@codeaurora.org>
References: <1630560820-21905-2-git-send-email-ppranees@codeaurora.org>
To: P Praneesh <ppranees@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696815604.13305.8404519954796662032.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:22:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012245_315808_F01DDE81 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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

P Praneesh <ppranees@codeaurora.org> wrote:

> Host driver doesn't need to process CE8 interrupts (used
> by target independently)
> 
> The volume of interrupts is huge within short interval,
>  CPU0           CPU1       CPU2       CPU3
> 14022188          0          0          0       GIC  71 Edge      ce8
> 
> Hence disabling unused CE8 interrupt will improve CPU usage.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: P Praneesh <ppranees@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

12 patches applied to ath-next branch of ath.git, thanks.

2c5545bfa29d ath11k: disable unused CE8 interrupts for ipq8074
6452f0a3d565 ath11k: allocate dst ring descriptors from cacheable memory
5e76fe03dbf9 ath11k: modify dp_rx desc access wrapper calls inline
a1775e732eb9 ath11k: avoid additional access to ath11k_hal_srng_dst_num_free
c4d12cb37ea2 ath11k: avoid active pdev check for each msdu
db2ecf9f0567 ath11k: remove usage quota while processing rx packets
400588039a17 ath11k: add branch predictors in process_rx
d0e2523bfa9c ath11k: allocate HAL_WBM2SW_RELEASE ring from cacheable memory
a8508bf7ced2 ath11k: remove mod operator in dst ring processing
cbfbed495d32 ath11k: avoid while loop in ring selection of tx completion interrupt
bcef57ea400c ath11k: add branch predictors in dp_tx path
be8867cb4765 ath11k: avoid unnecessary lock contention in tx_completion path

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1630560820-21905-2-git-send-email-ppranees@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
