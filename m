Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED6BC433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:33:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08D1161BFA
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08D1161BFA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IQh7IM0+r2cokX3luT7b7+78kcbKVv02/pCSTzEHrw=; b=WuirEn/kSHyg8K
	hRpWHSEyHYK4R+YCNU0lsfsjNpF2z097IM88bWy/5bSmDPCy6RtXrZBMrxO6PKfmYl7UlkIj4FwtP
	IQaz3Z6DVRTnI8m/MJLQcwTidIPiKIRIeMSVewT1pk8nmKHKKB04KcPbHkq9cOSuUgFV/1DMZGm1Z
	9TfyJxkg4OqnGhtZXGO6PGnL4ZkzU9uMMMzL7z39YHFBRLCg82Mb4BRA//zy2a6LF7KSY6VSblPBl
	uflCrvCOTFoGOUn3pPdt4D5GBF+u10N2Ka9hmuAx+9arLQ1lPPZzswGWfvzg+oOKX0ZgRfBndlXpl
	SC0L8s5FR1lwZhtj4Iig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmZIh-00FD34-OG; Mon, 15 Nov 2021 10:33:23 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmZFh-00FCNE-KO
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 10:30:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636972217; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=/kuNOKqnJebygxjyZF24saC37qgfQpUlPF991iaAtQg=;
 b=olD3uLFwnkbMTraHHL8xSWEhKq9ilsrAFZO0+qlfpnh2oyQLbzqRgGcBV0YPz3BE+kh7IkC7
 tkql92M45G4mFQE57gv5Dq4h5kl3L/9sZ0RX4lEryGMLp4QybD8ailQbpb5T4FRgyVdgiqbW
 OFdtmXnYbLKca5ie7uPzYUA7VWA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 619236b8e10f164c251456e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 10:30:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6D843C4360D; Mon, 15 Nov 2021 10:30:15 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 29271C4338F;
 Mon, 15 Nov 2021 10:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 29271C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/7] ath11k: support one MSI vector
References: <20211026041616.4956-1-bqiang@codeaurora.org>
Date: Mon, 15 Nov 2021 12:30:10 +0200
In-Reply-To: <20211026041616.4956-1-bqiang@codeaurora.org> (Baochen Qiang's
 message of "Tue, 26 Oct 2021 12:16:16 +0800")
Message-ID: <878rxpiudp.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_023017_786538_9414A01F 
X-CRM114-Status: GOOD (  12.39  )
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

Baochen Qiang <bqiang@codeaurora.org> writes:

> This patch set is to support one MSI vector for QCA6390.
>
> Depends-On:
>   1. ath11k: Fix crash caused by uninitialized TX ring
>   https://patchwork.kernel.org/project/linux-wireless/patch/20211026011605.58615-1-quic_bqiang@quicinc.com/
>
> Baochen Qiang (1):
>   ath11k: Set IRQ affinity to CPU0 in case of one MSI vector
>
> Carl Huang (6):
>   ath11k: get msi_data again after request_irq is called
>   ath11k: add CE and ext IRQ flag to indicate irq_handler
>   ath11k: use ATH11K_PCI_IRQ_DP_OFFSET for DP IRQ
>   ath11k: refactor multiple MSI vector implementation
>   ath11k: supports one MSI vector
>   ath11k: do not restore ASPM in case of single MSI vector

I assume this is v2 of Carl's patchset:

https://patchwork.kernel.org/project/linux-wireless/cover/20201223030225.2345-1-cjhuang@codeaurora.org/

Can you provide a changelog? No need to resend because of that, just a
reply to this thread enough.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
