Return-Path: <SRS0=+KM5=PI=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AD4C433F5
	for <ath11k@archiver.kernel.org>; Wed, 20 Oct 2021 08:14:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2D2D60FD9
	for <ath11k@archiver.kernel.org>; Wed, 20 Oct 2021 08:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2D2D60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mqgkc+1NawZA1ji1XxaN8HAltOU1cb7Cfll/T4UEMtM=; b=0JLWPIS2UFf2W+
	RBsJdiAT1kqTiTYBNMt/5fAOPfPS4S1QZUL7oDjlA0kVWCwef0/2oXHD7kKJP8qdf/TL8L6qZvAyn
	JK2Wk6ngOPrO4+XDygi+6kJhrD8s8EnZdgT23/s7Q/oduW7slEcGL/rrfJOtjxWYYrS0LrcQ7cw7Y
	OShb3INnuMiHdrYsxzwGBUU3+qd6fcls0+0hBTNJMD2VbTsKVQQFT4KRGUUG3Fr+p5mzbRSDZ/+2T
	6EnzKwz+BdDytICbtUGbz8xkk/mfdjL/OQZTyc61m/ra8hjbJ1l6tpv9zbROPL2sFKgsLS68TayQk
	v3xtwoq4eFiY0+p7A3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md6kM-003oL4-B7; Wed, 20 Oct 2021 08:14:50 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md6kJ-003oKV-Fk
 for ath11k@lists.infradead.org; Wed, 20 Oct 2021 08:14:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634717687; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=NGZBHHFY4Hgyh6lMMUZuqcpEe+5haS/Pk7c516X9Z2Q=;
 b=MpLlBr043hlv8+K9S+iYmaRlx2Oo3ELa8sod5kLGh0XnUwtPFNvabuIDLzJw8RWE72xSAP9Z
 hlzMhqp+glPqAVyrVP+MwCSwey7dkTHChxQhYSGXSMOLNq2CLIMBeP5PNwgkWDWYl/GBUkUH
 GoZFaTd6YLuP9saAxR+kUTLFCIY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 616fcff6b03398c06c98d42a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Oct 2021 08:14:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D9AACC4360C; Wed, 20 Oct 2021 08:14:45 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B7C0C4338F;
 Wed, 20 Oct 2021 08:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6B7C0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: enable power save in station mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211011190625.4463-1-cjhuang@codeaurora.org>
References: <20211011190625.4463-1-cjhuang@codeaurora.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163471767994.28889.7719435262601379113.kvalo@codeaurora.org>
Date: Wed, 20 Oct 2021 08:14:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_011447_654688_F6CDDFA2 
X-CRM114-Status: UNSURE (   6.91  )
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

Carl Huang <cjhuang@codeaurora.org> wrote:

> Enable power save in station mode.
> 
> Run "iw dev wls1 set power_save off",  check there is no NULL Data frame
> from sniffer. Run "iw dev wls1 set power_save on", check there is NULL
> Data frame from sniffer.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>

Fails to apply, please rebase on top of ath.git master branch.

error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:883
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211011190625.4463-1-cjhuang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
