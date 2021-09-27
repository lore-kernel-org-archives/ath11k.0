Return-Path: <SRS0=w2Qz=OR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACA9C433F5
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 04:45:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51B2760FC2
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 04:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51B2760FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt90FoaY722mpFDNxSsbN24HvIHJtko5hJjD2zH6cvA=; b=lhZeDWZDgXBUg05TCfQ7HtNFPu
	3Rr6mcQyobqTP0gpbv5BTcSZOlP38Pq3NwD5cErpy81hn3cUOXvm2JE7KAXW7tT8Au8itQBWBywUp
	2vdUTXJD9sxbe3tREn9/HvIYRUgiS+D59dSkN4XAd1Em0QthXIKMk8/F9kdZMazj0yD/ovRX9PpvY
	C/xW84nHoH8aU3XFGwUnZCUx9jDHlhCznLOGOMlKQazuKt+FQnls+dyg7BA0kpjyIqQF+T0V3QV2p
	Qu052tqkoF+j+5uf3IfGVwhMQ4Al2uZ+Vg6t4u+j9WGz10gByjYI3OR9oL5Pv0vRz+Iu3L64Upogj
	85FgJ3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUiWJ-001Ydn-LK; Mon, 27 Sep 2021 04:45:39 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUiWC-001Ycu-Td
 for ath11k@lists.infradead.org; Mon, 27 Sep 2021 04:45:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632717937; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=W7p3QXLDhHghk27urhivg8nixGDG0Pm9NPPoz9k5znU=;
 b=mHxf3TLf6UDzIp81GhVSLyMyI+00G4GbmLRLm+gCeyZj4KlIJRAQmJnRVIpDZ/E4HrkYjxsF
 O+3Esm4wOkFFOUzevlVQEELfmGvQErUCM3csZD4tP+95o2aZ78imvSXyacBJKu/ciXAOevSB
 sDonNsVH4wTAhg84ZSEgQleEIUw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61514bbc1abbf21d3485eeac (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Sep 2021 04:42:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 04BBCC4360D; Mon, 27 Sep 2021 04:42:36 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A74C3C4338F;
 Mon, 27 Sep 2021 04:42:35 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 27 Sep 2021 10:12:35 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 4/4] ath11k: add caldata download support from EEPROM
In-Reply-To: <875yuqrp4d.fsf@codeaurora.org>
References: <20210721201927.100369-1-jouni@codeaurora.org>
 <20210721201927.100369-5-jouni@codeaurora.org>
 <875yuqrp4d.fsf@codeaurora.org>
Message-ID: <53726bfd2c5d7911dc8433e7fd82d238@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_214537_397106_8A4D1E7D 
X-CRM114-Status: UNSURE (   8.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-09-24 20:34, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
> 
>> From: Anilkumar Kolli <akolli@codeaurora.org>
>> 
>> Firmware updates EEPROM support capability in QMI FW caps, send QMI 
>> BDF
>> download request message with file type EEPROM, to get caldata 
>> download
>> from EEPROM. Firmware takes more time to update cal data from EEPROM, 
>> so
>> increase QMI timeout.
> 
> The commit log would need more explanation how this patch works.
> 

FW advertizes calibration data support from EEPROM through 
'eeprom_read_timeout' in
QMI FW Capability message. Ath11k sends BDF download request with file 
type
'ATH11K_QMI_FILE_TYPE_EEPROM'. FW has logic to read calibration data 
from EEPROM and
process the calibration data. FW takes more time to process the 
calibration data from
EEPROM so increase QMI timeout to 10msec.

-- 
- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
