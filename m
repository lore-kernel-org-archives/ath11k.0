Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABACC433F5
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyIuK8SOftlFA38N8pa2nsOXga6iQgcfdQ/Ma7oq/eU=; b=xgS31O8yJaeDTX
	DmvKwZioV6htOGPVhduKnhA6LV7JMEJZ2kSd4soqA03lXbhG5F1SSWoh76J9FY/My1bchtc1M/3lZ
	b8AK5kVqZ5yV6AldjULaOvDJecKjrk2FylTtPwbII8TvjBsVQePpiDSmNaDETIKGEdetA2xvqcmMr
	iQlmuX266kIxIzp+m6wzhA9IYjDLD4JEYJipQ70O96vcmahTVX1NZeowLy4MnjJFgseWJECvcw4my
	I8cmrFr0nZ7lO+L5amEuU424eIQDG/HAJXkll1Q6HAFcazHRzWxBIXBZbrepOrUQU04ZS3KBS2vLl
	D1Ect+DwtRFtYbuX/Ceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp7za-00GD1e-5u; Mon, 22 Nov 2021 12:00:14 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp7ET-00FzbX-M4
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 11:11:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637579492; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=JYTaObHzIxh6C32B2N15FaPkWgjeQafVaeU47vgZa5E=;
 b=RXLj9/ymmiPNc3iE767qHf4qKXL/WWLHGKgWQi7ZRXwVrcrPLyziSMfShnhxpZTilHE+MoYu
 0111CC/wcnSx71PCFIGEai0UueX64d1Vbrn4L3S4s8x3SYZabTSU8rpnswIEYNWtaTAmnqd2
 U/bG0pdqHY0/ue6bwAIzRIY0BDQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 619b7ae36db8415cb7a0583f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 11:11:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 73D44C43616; Mon, 22 Nov 2021 11:11:31 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E70DDC4360C;
 Mon, 22 Nov 2021 11:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E70DDC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] ath11k: get msi_data again after request_irq is called
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211026041636.5008-1-bqiang@codeaurora.org>
References: <20211026041636.5008-1-bqiang@codeaurora.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163757948549.22734.11076988421581123204.kvalo@codeaurora.org>
Date: Mon, 22 Nov 2021 11:11:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_031133_965349_C8902484 
X-CRM114-Status: GOOD (  14.00  )
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

Baochen Qiang <bqiang@codeaurora.org> wrote:

> The reservation mode of interrupts in kernel assigns a dummy vector
> when the interrupt is allocated and assigns a real vector when the
> request_irq is called. The reservation mode helps to ease vector
> pressure when devices with a large amount of queues/interrupts
> are initialized, but only a minimal subset of those queues/interrupts
> is actually used.
> 
> So on reservation mode, the msi_data may change after request_irq
> is called, so ath11k reads msi_data again after request_irq is called,
> and then the correct msi_data is programmed into QCA6390 hardware
> components. Without this change, spurious interrupt occurs in case of
> one MSI vector. When VT-d in BIOS is enabled and ath11k can get 32 MSI
> vectors, ath11k always get the same msi_data before and after request_irq,
> that's why this change is only required when one MSI vector is to be
> supported.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

7 patches applied to ath-next branch of ath.git, thanks.

87b4072d7ef8 ath11k: get msi_data again after request_irq is called
01279bcd01d9 ath11k: add CE and ext IRQ flag to indicate irq_handler
4ab4693f327a ath11k: use ATH11K_PCI_IRQ_DP_OFFSET for DP IRQ
c41a6700b276 ath11k: refactor multiple MSI vector implementation
ac6e73483f7b ath11k: add support one MSI vector
915a081ff307 ath11k: do not restore ASPM in case of single MSI vector
e94b07493da3 ath11k: Set IRQ affinity to CPU0 in case of one MSI vector

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211026041636.5008-1-bqiang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
