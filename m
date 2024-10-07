Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7E4CFB43F
	for <ath11k@archiver.kernel.org>; Mon,  7 Oct 2024 13:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVbc7x7qGxvPs4q2XtOSLgTK7eiawW+8HJ7G1mC5t0I=; b=GyMc3eY036ZiUSy9iFuBgTGX6n
	t+7T4s5JXuDtT/rAGV3YKBV8lNsGbBYdO9BBbAxQaisIJelpgM+GUsOQLsbVNRKW5Je2O/46IO7Gs
	flEWfdcCHtNYf0nEaDaK85QOIrtMSR/p10vMkAVF7J2gZjLklmyUmARQWgxU8KPaXbyD+SBcl6z6K
	MEK4dzKO2Ox2baQSgpJkeB69xiCMidQXMAV2F16jKMo7Vtl/t80HStVVtjER7HvbOFPZHVP+Bx89R
	7HZNbRx2Z+P3+W8AjWPE1ISahuIYW1M+6V0G4Ml67PVw6jxDjKnEsJKJm3s5/yWWsWx4uY9ZhWzkD
	8tLEn3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnhV-00000002UqO-1clm;
	Mon, 07 Oct 2024 13:23:01 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnRD-00000002RXK-0xFM
	for ath11k@lists.infradead.org;
	Mon, 07 Oct 2024 13:06:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71dff3b3c66so704008b3a.0
        for <ath11k@lists.infradead.org>; Mon, 07 Oct 2024 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728306369; x=1728911169; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PVbc7x7qGxvPs4q2XtOSLgTK7eiawW+8HJ7G1mC5t0I=;
        b=fz7dB8+Zp2daPTFJ36zATUdUrdLO+uzD5Eyg/a1rGRKPDZwDyXxvXQ86iPcrTdU7GP
         XaU2znDf0Az2jNEm12kPaWiVCxkuiq8tFKPpjc3BBSO3IGGryUC3XLyuJpc0/y5Ep7Qr
         6GQylH3SFId5ZePNOscIhTkOpzacM1NUnIT18+AY5OoDypi+Wkkr+lQ+67jp9EOPZqqn
         WUBtR/S6xc3eHIulHNpVz5o2W7a1e8PIsPtcNmAQlp7WbcnGNzzKcVZyz1qZfQO2yLke
         aPBSKSK66iZ4MHJqUayDzCPH1hX0IYpQKLkEJD9Xs9BjLmvM7UxTq+ZwZegAwE8kVz81
         B14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728306369; x=1728911169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PVbc7x7qGxvPs4q2XtOSLgTK7eiawW+8HJ7G1mC5t0I=;
        b=OjDyPgHCu6b6fxmbZoMxugogXWfK43L8Egyh5l8pfobIU1Upmk+pPfMh1JhgZg0LYV
         7EL61/YY0ST6Oa9Yv9GbIft95xUGZpDJGc5upxsXqQwCsXFgJuFbCK/1/OKEcQTtA9CH
         vCRqnOuOycjEhYL/UcysUb6M8dgzEpCFyeUCDGWszwJPgv+5IZCqNjw37TSrGBTFtCJR
         oQzLRUWqHALjTOc+zJUYMnz7emr6ePYKmbBfpq9qnEguMpXMZc251b/1xtHm8krX2DJj
         klVJMGOo9aRGpEr2jqFscOX2VwuuVGo1ShXR49FFh+azM5ax01OwdvkGRakPObcD3CSD
         7nfQ==
X-Gm-Message-State: AOJu0YwH3W0R+MBXaGw9Y/KYl0kKtzZLRENxYxKBTTCv+mqEXxcG7TFB
	VbwTvaNWxnCpkkIeEhilrJPBerPSoBtdbnX9mhiPMBX8bo87CUx3
X-Google-Smtp-Source: AGHT+IEBokp742xlJXBM+MooOnnuVX8tXk84A4LTmcw9Fd7Zmd5xB+kiCRAuVzfGh9bR6h1QzdaIRQ==
X-Received: by 2002:a05:6a00:1893:b0:71d:f510:b791 with SMTP id d2e1a72fcca58-71df510bbdfmr1864578b3a.12.1728306369364;
        Mon, 07 Oct 2024 06:06:09 -0700 (PDT)
Received: from [192.168.1.164] (h69-130-12-20.bendor.broadband.dynamic.tds.net. [69.130.12.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f681f1e8sm4197232a12.28.2024.10.07.06.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 06:06:08 -0700 (PDT)
Message-ID: <4ce007ef-5a5e-4403-b53e-fe13513f21b5@gmail.com>
Date: Mon, 7 Oct 2024 06:06:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing scan results with SCAN_FLAG_COLOCATED_6GHZ set
 (Ath11k/WCN6855)
To: Ben Greear <greearb@candelatech.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <cfb00919-678f-408d-9fb9-83fc24fee197@gmail.com>
 <d1e75a08-047d-7947-d51a-2e486efead77@candelatech.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <d1e75a08-047d-7947-d51a-2e486efead77@candelatech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_060611_288759_7F156067 
X-CRM114-Status: GOOD (  24.73  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Ben,

On 10/4/24 12:18 PM, Ben Greear wrote:
> On 10/4/24 11:46, James Prestwood wrote:
>> Hi,
>>
>> I've noticed that when setting the colocated flag much of the scan 
>> results are not appearing when they should be. This was seen in a 
>> large warehouse where our network/SSID was using only the 6ghz band. 
>> There were other networks on 2.4/5ghz though, which maybe is having 
>> some effect, but those networks are not broadcasting on 6ghz.
>>
>> This first came to my attention when the majority of our clients were 
>> experiencing horrible signal quality. Upon looking at the logs and 
>> nl80211 messages to the kernel IWD was issuing both limited 6ghz 
>> scans as well as full spectrum scans and only showing a few 6ghz 
>> results, like 1-2 BSS's which should not have been the case. I was 
>> able to scan manually using "iw scan" and I saw all the expected 
>> BSS's. I isolated it to the fact that IWD was setting the 
>> SCAN_FLAG_COLOCATED_6GHZ and removing that flag resulted in all the 
>> BSS's showing up in scan results. Note, that with or without the flag 
>> all the 2.4/5ghz BSS's were showing up without a problem, it seems 
>> completely isolated to the 6ghz band.
>>
>> The NEW_SCAN_RESULTS event was indicating the kernel had scanned all 
>> the expected frequencies we were asking to scan, but the results were 
>> mostly empty for 6ghz. Only ever the connected BSS would show up and 
>> _sometimes_ another BSS, but generally not.
>>
>> I'm trying to read through the code associated with the COLOCATED 
>> flag, but its not exactly intuitive (to me at least). I'm not sure if 
>> this is something with mac80211 or at the driver level. I really 
>> don't have anything to compare it to as ath11k is the only hardware 
>> available at this warehouse with many APs around.
>>
>> I'm looking for some guidance on if this is expected behavior with 
>> the colocated flag, and if there is any concern with including it 
>> unconditionally on every scan. If it has unintended consequences like 
>> this, generally, across multiple drivers I'd like to re-think its use 
>> in IWD.
>
> I had some similar issues using hostap, and hacked it to do every 4th 
> or so scan with that
> flag set differently.  Hopefully that lets the 'fast' scan work when 
> it can, but still lets one
> scan the hard way...
>
> Possibly there are driver concerns too, I was using Intel be200 when 
> debugging this.

Thanks for the extra info. Seems like a mac80211 quirk if its also on an 
Intel card. Long term I may just parse RNR elements in userspace and 
issue extra scans if needed.

Thanks,

James


