Return-Path: <SRS0=ASgL=OZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B378C433FE
	for <ath11k@archiver.kernel.org>; Tue,  5 Oct 2021 14:07:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 675856115B
	for <ath11k@archiver.kernel.org>; Tue,  5 Oct 2021 14:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 675856115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oc6f9yXtol4bcpl3eA+q0+GrC4rFv7Xo3eAzUTTnrtU=; b=gKLjpMoyzf2n5k
	KV2OFzW+jFHrXVkViUNuhON6jbXkPUYE08KZ/S+5DZu6si5rZnvf4LoRNfcImoWLnkFD6Ylq64A2S
	NaPmGIQFCCdHSoMm2kCXc0vpKhErBcua2dugh3bb6b6yT0UeBMV0u3L5H4uzP4iRQm4YjIZgW3QV+
	cVMbeLLbLJYE0NJeKa4riI7kvJKfTr6dBqa9byIyfo7BM++VhV+7GbbNUkhDpzn7MY2e4Sq1OYbq8
	x9X284oxZB1aE3m2wSxfr13PHuMcN/SIzKY2p3ppL/lyQYHuvx22Cz/mpceyDjxiGwHTn7bMpSb0y
	ckB8ISYCSbxqZeC5gwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXl6m-00AnY0-4s; Tue, 05 Oct 2021 14:07:52 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXl6E-00AnPO-LA
 for ath11k@lists.infradead.org; Tue, 05 Oct 2021 14:07:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633442867; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=Jg3m/g25bkbWNO+TyC8tvVbjrTAyib8vW1P1iQJqXDQ=;
 b=ShEbaqzQjk8VDHMpjeKFbjjQZyeUsBBQ+pHY3GDQi4H+NqrKTo86Bbd6ovQgesq9PCQgRjsv
 ucPcxeAC85dGuGb5JwaN8/kYlyggoi88hNIyVJileBClPdknCWAPrzvJL5gwnlswkXrrkv9F
 EhLkH4Bni1f3GWO6d8O7tap2sSc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 615c5bd7b8ab9916b394a062 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 14:06:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 25BA8C4314B; Tue,  5 Oct 2021 14:06:14 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 82AE6C43460;
 Tue,  5 Oct 2021 14:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 82AE6C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: bqiang@codeaurora.org
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/3] ath11k: Change number of TCL rings to one for QCA6390
References: <20210914163726.38604-1-jouni@codeaurora.org>
 <87tui4pwdz.fsf@codeaurora.org>
 <42fa097a799050100b6978ef0ab4e8b8@codeaurora.org>
Date: Tue, 05 Oct 2021 17:06:09 +0300
In-Reply-To: <42fa097a799050100b6978ef0ab4e8b8@codeaurora.org> (bqiang's
 message of "Wed, 29 Sep 2021 10:15:45 +0800")
Message-ID: <87ee8zftwu.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_070747_932878_84368D40 
X-CRM114-Status: GOOD (  13.83  )
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

bqiang@codeaurora.org writes:

> On 2021-09-28 23:12, Kalle Valo wrote:
>> Jouni Malinen <jouni@codeaurora.org> writes:
>>
>>> From: Baochen Qiang <bqiang@codeaurora.org>
>>>
>>> Some targets, QCA6390 for example, use only one TCL ring,
>>> it is better to initialize only one ring and leave others
>>> untouched for such targets.
>>>
>>> Tested-on: QCA6390 hw2.0 PCI
>>> WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>>>
>>> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
>>> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
>>
>> It's better? Please be more specific. Does this fix a bug or is this
>> just a theoretical fix you found during code review?
>
> Yes, this is just a theoretical fix. By "better" I mean there is no
> need to initialize
> the other two TCL rings for QCA6390 since they are not used.

Thanks, I changed the commit log now to this:

    ath11k: Change number of TCL rings to one for QCA6390
    
    Some targets, QCA6390 for example, use only one TCL ring, it is better to
    initialize only one ring and leave others untouched for such targets.
    
    This is a theoretical fix found during code review, no visible impact.
    
    Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
