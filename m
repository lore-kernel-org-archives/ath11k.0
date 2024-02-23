Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D33C54798
	for <ath11k@archiver.kernel.org>; Fri, 23 Feb 2024 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/aINjorUzOodywEXZfg0nVueIK+OyFNiNfskoaDd89g=; b=Gk0SvyiagusoJaCAEXFw3YEdS/
	NhEFU4GItix/uf1cWM+83tJoZ8FJx/5/ig9Dv5WPwLGZXG2U8l9OtEO2lUG9dj9JqVPYGJgj5eZiO
	NCtBCKOUpmjpBLNWdA3qOKSgepC+BVafXoUdVq3kIuygPf0yUtXARukL/FtajpqBQ3Icqt9usgE0k
	0wJs3byWuMlrdJBqH1gJ52hhcrFBBW7qiQuxah1CMx27zEPcPVM8Ef0oi3BtYTNFRp0BHw2nNARDV
	J9Kh2lqwdzHKNY8kp7oPdylE3250UXekVXeIbiayz6mi9v2BF6xV0O5W1fryqmIAOw6H+/7cpk4Jd
	JwqqZ4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdYBH-0000000AAxn-0Jbq;
	Fri, 23 Feb 2024 16:13:53 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdYB6-0000000AAtZ-1f9Y
	for ath11k@lists.infradead.org;
	Fri, 23 Feb 2024 16:13:38 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7877468beacso40470485a.1
        for <ath11k@lists.infradead.org>; Fri, 23 Feb 2024 08:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708704810; x=1709309610; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/aINjorUzOodywEXZfg0nVueIK+OyFNiNfskoaDd89g=;
        b=CeWMZAcy6HUq2SwU/TQQ8nDLnQZ5kGkf0wzaXAp+T98NEfWZu0BPAW4OFWPLvDdEQJ
         ZpXLgV+E/mOIaKzr+mT+mhlOv1nV3Bvdw92q7y+o32OWuT1s8pkyapxjj3BX+I3t1SRQ
         zaGLl3R+Lqaf+8wOIoB54xN0/Z2yNmVv26hkp+pv69Qm4qkGOAW74iTI8SzTvpVB8jQW
         pXw/9LjNyJdlXGCNIaAENELyDAR60Pg97CWbqCrPb0sK6O1dqt6lJ8exmuoysgcL3lil
         M40NL+ATHfOeqHHyKpqpLBvmdXpcvrVVMJFoSf+LEyYJYWBlQyY2oR86AY/2wWppoAmT
         lFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708704810; x=1709309610;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/aINjorUzOodywEXZfg0nVueIK+OyFNiNfskoaDd89g=;
        b=q1HBDj6dwUNyM/I4OUHFrXJPfCdhFjPOfRW4n6Bm0kzWm15N5eu92NB8HAd5oMHiZz
         2bEBSJDwwEeIDQQPgCq4caQkfeeqfU11VILQ8KMAdxBXjyh75kWf9K2d03uNm9mwx+wt
         0bFX1RXgIO4JfgXImFBDIUimvYBaPNfWzzniueOU4ngb2UhCwHrqxm1pFjyG3n9ENzgM
         EQqk0opUB7VtV1hHOHtOeKLPHKu7pZ+D27gWfu3dcrC73Ev0Lx2ra7+Ws3CGZBHry4Uq
         5LDPKzCzgNpkQeyF7J+AQKXPDYNVX4Cst3wtt9wznuQBlfnisY551EMxI8Ndzhl20T6d
         OFZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEOjBUMHeHXIYAWJsEjgM3aX9Mue5D3JjB4Rh6yFGLScMvLp00w0h4XZXuljGiAZk20L+gzLHIQBm214oZWQQA9RANPzkyLaz+xA==
X-Gm-Message-State: AOJu0YxMIMEwDUtdJR27LqM/zz1PVvaONkByq5mk2lX/Gyh2mRsVyqqw
	WO2qXBKcn5J7bPHNhLMgPsUojfB4cuZmRl0v9q1zR7WSMWLiGrLI
X-Google-Smtp-Source: AGHT+IGqlviBHlDCdHrq5HRWGzCKI8tDSdcP+63u8he/GGEyPqbjgXiLHlzOXmBpkYAiBhKcv/zg+w==
X-Received: by 2002:a05:620a:2098:b0:787:2b1f:1c50 with SMTP id e24-20020a05620a209800b007872b1f1c50mr308988qka.52.1708704809794;
        Fri, 23 Feb 2024 08:13:29 -0800 (PST)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id ay8-20020a05620a178800b00787bc6ebfa7sm74024qkb.60.2024.02.23.08.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 08:13:29 -0800 (PST)
Message-ID: <3cd77b50-f681-4b74-bdaa-6e2bd73ad744@gmail.com>
Date: Fri, 23 Feb 2024 08:13:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k multicast action frame RX
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org
References: <dcdbd757-ad6e-4fe0-a0c1-fe328431b73b@locusrobotics.com>
 <642b61a6-e3c0-4831-887f-f25314bf166d@locusrobotics.com>
 <90ac3bdc-8797-4d57-8bc9-48e0ad406674@quicinc.com>
 <1dafe0e5-292b-4764-86c7-cc1757aeb3b6@gmail.com>
 <ed8eeb92-e1eb-445e-989d-2340c26faf44@quicinc.com>
 <7a62031b-ad1f-4da2-8217-19a5d7fdc0f4@gmail.com>
 <f363f179-b41f-4bea-882f-e4aacb8ad519@quicinc.com>
 <eaeb8e9b-3809-4f89-a5b2-7949aa01fbde@gmail.com>
 <026d9ba3-525d-4a12-8d03-5fece818330c@quicinc.com>
 <0e8ad2c2-cc39-4903-97f7-c3ffb525e61a@gmail.com>
 <df35ce71-84dd-4c2c-af9a-820cb9a71291@quicinc.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <df35ce71-84dd-4c2c-af9a-820cb9a71291@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_081336_565757_3C8573D6 
X-CRM114-Status: GOOD (  13.78  )
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

Hi Baochen

On 2/22/24 5:56 PM, Baochen Qiang wrote:
>
>
> On 2/22/2024 11:38 PM, James Prestwood wrote:
>> Hi Baochen,
>>
>> On 2/21/24 6:26 PM, Baochen Qiang wrote:
>>> But you are using monitor mode, not station mode, on ath10k, right? 
>>
>> No I'm using station mode. It looks like ath10k creates a monitor 
>> device to receive these frames (that was already done before my 
>> patch), but the interface I'm using from userspace is a regular 
>> station interface
>>
> OK let's forget what ath10k does to receiver those frames for now and 
> focus on ath11k. From what I got from firmware team, it's expected 
> that ath11k station interface can't get those frame without a scan 
> because device A is connected to an AP already and is supposed to get 
> frames only from within the BSS, apparently device B here is not 
> within that BSS.
>
I still don't know why a scan would change anything. Maybe the act of 
scanning triggers something in the firmware to allow the RX of multicast 
frames (like to receive probe responses)? If so that's not really a 
mechanism to enable multicast RX, its just a side effect of scanning.

But yes currently when an ath11k device is connected to a BSS it will 
only receive frames from within that BSS. This is what I was attempting 
to change, allow it to receive multicast action frames while connected 
(or disconnected for that matter).

The whole point of DPP is to provision a new device. So one device is 
offline and asking the connected device for credentials. This is done 
via multicast action frames.

Thanks,

James

>> Thanks,
>>
>> James
>>

