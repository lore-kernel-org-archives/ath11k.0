Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB1FC433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 09:26:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A05861130
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 09:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A05861130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=av0QLMnlXmIBcos8bs57Fop64ujjGKTl/Cr/nvzcXrY=; b=gwPF16OFgds04/
	520av3HESXKqlRZfa8FD/lNYdIms331SR6jqOP/ENzqAJ8ULEvdqRTgYrtTVKKMAttPSg0neni2Sk
	hruuyDcph+lE1EvGD1MNlpyXIYxIi6W3qmLvVjliujtw7JceVkOwXuphr6f2ZulsF+cEJYQTQ+J8u
	dBkG8RwyD3Ckp9k7jcD8XMQX2gj8a+hvmBYqYDZeZKXOxxLU7BIyLh174cFdMYqjq+eGgZotY+IRr
	OaKyuBTbee+oVhlAH2/EDwNz2xOSx8YlAngwLlxP9Lvd3FtUh+PR0LVMAY3rOh6Wf1te+t5MfkMcg
	WdMtNN1RARb26CApjtSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV9NO-006aEj-QG; Tue, 28 Sep 2021 09:26:14 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV9Lp-006Z9J-MY
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 09:24:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632821080; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=8g1WmO4zsI0Qad1a7UPKfzGAjqJuKEOek2wPadV/g+g=;
 b=VIb3KDJNdHWneik/ooUuHZuxv2zpkxgJSnwey/gBOIW6nzKkhIXHhm7HnNmRjIdEOSjOu7Mo
 NldUJ9s2Qvj9rQbUF0888E3rxrukEhD7ajt+JA/7OyJq3f1i2gUrZC2aI0A2TSGiIAz6/DBK
 AUyS8yxaaxdYheWW7ObuoNxe7ks=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6152df4a519bd8dcf0cd04bb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 09:24:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6D099C4338F; Tue, 28 Sep 2021 09:24:26 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E3BFDC43460;
 Tue, 28 Sep 2021 09:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E3BFDC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 4/4] ath11k: add caldata download support from EEPROM
References: <20210721201927.100369-1-jouni@codeaurora.org>
 <20210721201927.100369-5-jouni@codeaurora.org>
 <875yuqrp4d.fsf@codeaurora.org>
 <53726bfd2c5d7911dc8433e7fd82d238@codeaurora.org>
Date: Tue, 28 Sep 2021 12:24:22 +0300
In-Reply-To: <53726bfd2c5d7911dc8433e7fd82d238@codeaurora.org> (Anilkumar
 Kolli's message of "Mon, 27 Sep 2021 10:12:35 +0530")
Message-ID: <87ee99qchl.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_022440_242338_37355936 
X-CRM114-Status: GOOD (  14.37  )
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

Anilkumar Kolli <akolli@codeaurora.org> writes:

> On 2021-09-24 20:34, Kalle Valo wrote:
>> Jouni Malinen <jouni@codeaurora.org> writes:
>>
>>> From: Anilkumar Kolli <akolli@codeaurora.org>
>>>
>>> Firmware updates EEPROM support capability in QMI FW caps, send QMI
>>> BDF
>>> download request message with file type EEPROM, to get caldata
>>> download
>>> from EEPROM. Firmware takes more time to update cal data from
>>> EEPROM, so
>>> increase QMI timeout.
>>
>> The commit log would need more explanation how this patch works.
>>
>
> FW advertizes calibration data support from EEPROM through
> 'eeprom_read_timeout' in QMI FW Capability message. Ath11k sends BDF
> download request with file type 'ATH11K_QMI_FILE_TYPE_EEPROM'. FW has
> logic to read calibration data from EEPROM and process the calibration
> data. FW takes more time to process the calibration data from EEPROM
> so increase QMI timeout to 10msec.

Thanks, I now copied the updated commit log below. And do note that the
timeout is 10 s, not 10 ms.

    ath11k: add caldata download support from EEPROM
    
    In some devices the calibration data is stored to EEPROM within the device so add
    support for that.
    
    The firmware advertises the calibration data support from EEPROM through
    'eeprom_read_timeout' in the QMI firmware capability message. ath11k sends
    boardfile download request with file type 'ATH11K_QMI_FILE_TYPE_EEPROM'. The
    firmware has logic to read calibration data from EEPROM and process the
    calibration data.
    
    As now the firmware takes more time to process the calibration data from EEPROM
    so increase QMI timeout to 10 seconds.
    
    Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1


-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
