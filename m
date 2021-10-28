Return-Path: <SRS0=748x=PQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE956C433F5
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 12:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFC0F6044F
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 12:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFC0F6044F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OG7FwhFJ4UK0J/iYSXdL+/bzNfFJ/X0ZdskQ2ioQARY=; b=XNyMhkclQph8vk
	HzXcwgsyhmJoj1qP+wYKUBrT7Ymw9NlQMUzTE96ooAliOggZ/f9KC8ISLQPwPz1TYEDWL4uoE0x/0
	dlyiCpa/Ad8TXLJ8jcocKaL0lHda3x9x5JhUGExHzSmf8eAJ1pmR5rblot9nBnad5QXN/orl95KyL
	YX+OHUdsAgiKr0HW0vCP0jMbfSsaPkMjLgET6bX5MKsseZeBghWNQtw6zw1Xn3uEivFDPrRjvIws4
	cKYlN8zaoYPUeQ6BF0FhltSErOQSO0r/LVv5AYwx/oIiw+ymzE769mM5Qx458dhMJKmEbONT27hQu
	ucngRkW1+P0p3n98mB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg4g3-007nhk-6X; Thu, 28 Oct 2021 12:38:39 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg4fy-007nh8-TL
 for ath11k@lists.infradead.org; Thu, 28 Oct 2021 12:38:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635424714; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=OAbJK0hmNqFm9vcVvRcq6E/aTYQVuqr4Y4YCpajbbX0=;
 b=gSEPfFCM6ik91xsF+qXr+DYOzeOCiE8ctwHpZbKlrRFxk1bQbuL3vvzW7xCwSSUOkzTojhm8
 3qejCFWohEnIQ1nySYUgqlq85oNmLkZ/YN15OCi8ZmFYeKxvQ3jKHJYQNa/xRxBacy0efNZt
 Z5MKJZPeJdpWOwZWoqCJmZUzb2o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 617a99c9ff3eb667a78ea973 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Oct 2021 12:38:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 47E21C4360D; Thu, 28 Oct 2021 12:38:33 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B472FC4338F;
 Thu, 28 Oct 2021 12:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B472FC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: Re: [PATCH] ath11k: clear the keys properly when DISABLE_KEY
References: <20211026155446.457935-1-sven@narfation.org>
 <26869605.A2Tbvc0WiF@ripper>
Date: Thu, 28 Oct 2021 15:38:27 +0300
In-Reply-To: <26869605.A2Tbvc0WiF@ripper> (Sven Eckelmann's message of "Wed,
 27 Oct 2021 08:12:35 +0200")
Message-ID: <87sfwl494s.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_053835_054727_7E66B0D9 
X-CRM114-Status: GOOD (  14.09  )
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

Sven Eckelmann <sven@narfation.org> writes:

> On Tuesday, 26 October 2021 17:54:46 CEST Sven Eckelmann wrote:
>> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>
> I would like to retract this Tested-on. My test caused another problem which 
> resulted in a complete shutdown of the vdev. After fixing this problem, it 
> turned out that this change didn't fix anything (as far as I can see) on this 
> firmware version.

But it doesn't either break anything either, right? So in that respect I
would like to keep the Tested-on tag in the commit log to document how
it was tested.

Though I'm not sure what I do now, do you think I should the patch still
or should I drop it?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
