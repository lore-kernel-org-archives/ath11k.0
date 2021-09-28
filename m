Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953ABC433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 15:12:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 568DD61213
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 15:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 568DD61213
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SZmABSjjCrHNygheMp8Ki8WmVG82vuNa6Qr+mbcERA=; b=eWhrp0yULCogm0
	k7hJczszsGAaLoz676A3KBYp8UQnUCQ9kRPUTlzWKW/RRxgURBM82JuYKbFcIfugHG566Zo0lbPQn
	UO9icoB+196a6q4KotctXxC9LjiYFmPZXmRkkgeltoJoTH4Ei/hcYoFIFPr/cE11ppn/7+THzkDZg
	iDZMmCoNiMN59M77Uf9jrbR6vybTkRlzGl+BAaAmRkP70/k3GL0OWSTvJkoFiq7ntf5RO9F6LrBNO
	a8mth3h3e33pUuJx0wqcH5ENh7qa1jCOPudIWC98RVzmza0dOb5Tgr9/BiQeyCtJmGSL554WR2CGy
	xIZ+GK6A/j/3fp0sqSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVEmu-007jAv-Jr; Tue, 28 Sep 2021 15:12:56 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVEmi-007j9b-PV
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 15:12:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632841974; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=ZR2sJrlc8RTC1uxRbiguSPjYVpPg+2YaLq//aNbn0Mc=;
 b=m0gzgT7dg4s6mJshwpvnxqSfUPjvFW/RaNYVGzpgBvN3VtaozDeITKwer0QZ8Hw5arFBiD9b
 SPxC1WcQtDSWbBKZRN7B4OOCpzMY4Vjj9TG/UpyCbJsUxnPDi/x8G2UydPUJQMvajxzWDpW1
 /bi+fjgd+ZsqbneyCWghuyN+dug=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615330cc3cc3a01f260ce23f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 15:12:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9DC30C4360D; Tue, 28 Sep 2021 15:12:12 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 32951C4338F;
 Tue, 28 Sep 2021 15:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 32951C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>
Subject: Re: [PATCH 1/3] ath11k: Change number of TCL rings to one for QCA6390
References: <20210914163726.38604-1-jouni@codeaurora.org>
Date: Tue, 28 Sep 2021 18:12:08 +0300
In-Reply-To: <20210914163726.38604-1-jouni@codeaurora.org> (Jouni Malinen's
 message of "Tue, 14 Sep 2021 19:37:24 +0300")
Message-ID: <87tui4pwdz.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_081254_407543_4B4F45FE 
X-CRM114-Status: GOOD (  12.18  )
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

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Baochen Qiang <bqiang@codeaurora.org>
>
> Some targets, QCA6390 for example, use only one TCL ring,
> it is better to initialize only one ring and leave others
> untouched for such targets.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>

It's better? Please be more specific. Does this fix a bug or is this
just a theoretical fix you found during code review?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
