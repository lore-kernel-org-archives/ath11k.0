Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19186CD11C2
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 22:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soEZM/3jVaj/ItjpFqCPn2azxLmCK0C35uqBfBYWbaU=; b=hZ2au2UpIYCqEDiC72G/pQ7lo5
	IumS/TMXiz09UHVe9jdjy8Z40P81tJx/+elevd+YsaFuGq6III+SFzA3K3Kxj1NeGGB59D6nJ6+nk
	5JCOnJGOtKJmegS2omD4YxtAE0vYJUpYpAT/iijkfdIUrfF10jBRTUj3nE/cBROwdGeiaZ5paEXzE
	bQ4rGL+7pF4TAR42eCyVdqLUWnMqOwS5zOecYaGUVfvTJZKb9clp9NzsAnFBue3/yA5dfHXG/ljZ0
	v9DQfLXt+q3bmtZDyXKAEDO2heAH/sL5jNJ6JRV0YKh2oLZjMG0tvpWpMmaq7jYq53T4ZGybecdoB
	dhzNJuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugcR-00000009GRQ-1gkb;
	Wed, 10 Apr 2024 22:40:39 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugcN-00000009GQh-1aZr
	for ath11k@lists.infradead.org;
	Wed, 10 Apr 2024 22:40:37 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ed5109d924so2909782b3a.0
        for <ath11k@lists.infradead.org>; Wed, 10 Apr 2024 15:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1712788834; x=1713393634; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=soEZM/3jVaj/ItjpFqCPn2azxLmCK0C35uqBfBYWbaU=;
        b=cVm2Olp0MwBKj/uLJHS62loV3i7DiYR9flEQQZAqpYqHw8XhrXRipVrsHqsB6KcIGt
         cOIpKjOnqR6Ca8j8KjWNxDFud2EJJBV2PgkZHHnXgp6S3sxH2zfKN8zYaQQWYk7EL1Ae
         BS/jOzTGtBv44MYDOPV/Z/BQXtsCfVw8FWoF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712788834; x=1713393634;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=soEZM/3jVaj/ItjpFqCPn2azxLmCK0C35uqBfBYWbaU=;
        b=h+1K91ftmHXnXFN+HbRIR3LFK7fJo9oS1xb0o2VECji8P/lPaPStXXIqSgTH5lpCzJ
         wuC0nIffh8NmJklB73FfA7PHjDa6ezDHJHtfIrIJDgDyRWkQcYE3fL+B0KFMFEJNHd3u
         l5zzMprCOU9d6aW/trbdd2X7BrfmEalAz0zmvH2BhI6v82bC8Ergris4UJF79tN7MojH
         lk30mSkSKE4P10KIVDIFY614PI0TfHWl9cxgF6arQeRxxnYBTaFKZP25CBdjJ5SVlW7w
         LtuZY10zic2sss3n89ch+IxD+i0NzgGowUiwN8cT+vEhmmuYXGApFF4Xe7Ljp19Ss4iS
         Qf6Q==
X-Gm-Message-State: AOJu0Yz6f0xbYIUS6zYCJiRfeRI7XaG1GsCWiL0gch0dwm9JSOLOUBCa
	9ZMsygM/ts45i3rpiN/qldgj1XnDgQvFVHuDEg/nplf5bFZHI36efO6Km2K+lA==
X-Google-Smtp-Source: AGHT+IF7/I+UW2aRd7T6Ky1OR8EPkbbZg4FHEpxyZnPDrN6EZpxIopUpklml4CBddN9rW7g+uAfZLA==
X-Received: by 2002:a05:6a00:803:b0:6eb:40:6bff with SMTP id m3-20020a056a00080300b006eb00406bffmr4730839pfk.14.1712788833990;
        Wed, 10 Apr 2024 15:40:33 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id bw36-20020a056a0204a400b005dc507e8d13sm40322pgb.91.2024.04.10.15.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 15:40:33 -0700 (PDT)
Message-ID: <8162d6c7-d968-465e-bb8f-3c939eb8d783@penguintechs.org>
Date: Wed, 10 Apr 2024 15:40:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or
 disable/reenable
From: Wren Turkal <wt@penguintechs.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>
Cc: ath11k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>
References: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
 <31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
 <1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org>
 <b592d037-41ed-42e8-8c3c-286eb1a68ceb@penguintechs.org>
 <68a31d6a-8eb8-4d78-819b-fb67367cc41d@penguintechs.org>
 <CABBYNZJQUy37fxWuCXV1OgM+DNnOr7V0h_rkgcSdw-5hF7iauQ@mail.gmail.com>
 <fca46585-c1ed-4a60-91b5-6da39a5bbdec@penguintechs.org>
 <02400664-2d23-42d3-b49b-0c59f606d298@penguintechs.org>
Content-Language: en-US
In-Reply-To: <02400664-2d23-42d3-b49b-0c59f606d298@penguintechs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_154035_686484_9261D2E6 
X-CRM114-Status: GOOD (  22.52  )
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

On 4/10/24 3:00 PM, Wren Turkal wrote:
> +Johan since he's a former BT drivers maintainer.
> 
> On 4/9/24 1:11 PM, Wren Turkal wrote:
>> On 4/9/24 1:03 PM, Luiz Augusto von Dentz wrote:
>>> 5.19 seems a little too old, imo, or has it been broken for that long,
>>> did you at least tried with bluetooth-next? Try contacting the people
>>> who actually wrote the driver.
>>
>> Sorry, I didn't answer your question. Yes, I do think it's been broken 
>> for longer than that, but I wanted to confirm.
> 
> Okay, so I tried 6.9-rc3 and every main release 5.19-6.8.
> 
> I have found the following:
> 
> * older kernels (6.3 and before) seem to be far less likely to kill on a 
> cycling the bluetooth service.
> * 6.8/6.9-rcs consistently destroy bluetooth when stopping and 
> restarting the service
> * If I destroy the bluetooth service with a BT service restart in 
> 6.9-rc3 and warm reboot into any release back to 5.19, bluetooth does 
> not work
> * cold boot works in all cases assuming I give the laptop about 5s 
> between power off/on

I just did another experiment on 6.9-rc3. I blacklisted relevant 
bluetooth modules and then warm booted without the blacklist. I did this 
for both the "bluetooth" and "btqca" modules. In both cases, I cold 
booted with and appropriate "module_blacklist" kernel arg. After the 
boot, I verified the module was not loaded. I then warm booted without 
the blacklist, and the bluetooth works, so bluetooth only seems to fail 
when the linux module code for closing the device is run before a warm boot.

> So, I suspsect that the process of closing out the hardware may be 
> leaving it in a state that the reset cannot handle (and probably never 
> could handle).
> 
> I also found that qualcomm has docs here: 
> https://www.qualcomm.com/products/technology/wi-fi/fastconnect/fastconnect-6800#Documentation
> 
> However, I am not a member of a Qualcomm verified company (mentioned in 
> the doc links). Luiz, Marcel, or Johan, do you have any contacts that 
> might be able to help me in getting info about the technical docs for 
> this hardware? I would love to see if I can find any issues in how the 
> hardware is being reset.
> 
> As an independent dev, I don't even know what it takes to get that kind 
> of access. I would welcome any help here. Hey Qualcomm, are you hiring? :P
> 
> wt

-- 
You're more amazing than you think!

