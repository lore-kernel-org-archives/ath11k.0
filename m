Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BE9CD11C2
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 22:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBagYfSF2VpuPkFqS5FJ8XAb1CielWua0CPGtB5IEPE=; b=BawpPIbbMLz+Vs80jhnbbUH4kZ
	zDITVf5H2wU3cJkd6CC7TqEYQh0NbTdmDs9Xcs+EgfgF3yOCc2yJM8gouEzCjqH7VdGZZz8kKW3/n
	QNVE0XT0Pzd8kQM5ZrZTZSBdy6KI87ucTXAKdbcBnZfkcIuwRG28Pzr32E2QKF+NdLNAp7AlMjqBS
	MAlt0MIuJqUMxqlLXw0fM151rTr60jA+Pc0iIpzT3GEOr/zvDd34lqPN4HdvK+oCWt+vAumHlLuKB
	nIGAUVGsbHO6URjQGk9QW9bdFhCtTzI12NPi/PPLDIcFd3UbDiVPN8hjr3+jxiZM5Zksi87WxDwYX
	wNjZ0Uhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rufzc-0000000989h-05HH;
	Wed, 10 Apr 2024 22:00:32 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rufzX-0000000988C-42ey
	for ath11k@lists.infradead.org;
	Wed, 10 Apr 2024 22:00:30 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so193583b3a.1
        for <ath11k@lists.infradead.org>; Wed, 10 Apr 2024 15:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1712786425; x=1713391225; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xBagYfSF2VpuPkFqS5FJ8XAb1CielWua0CPGtB5IEPE=;
        b=aCIwat+9XABoWD62HT4IupJLVBQOLgcb/m9RAXJMmKydlvmIB/1WS1C4x3riw/dHov
         KognOtN95TJ3o0svCm12YvMhGLousywoZgceSdNCcGPDkagZ1dl7P5cOzvGHonD720R2
         j61XQNMCOxLJRJA6aNOhEWf3rk9J57AnF89t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712786425; x=1713391225;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xBagYfSF2VpuPkFqS5FJ8XAb1CielWua0CPGtB5IEPE=;
        b=q6OvxeLMDgYSA/Za5n5EMRqTjL9wz4Bzs+hP8Vb4cfSh9M98knjK+T0tpTCkCDJ8B1
         T0EdoxEa7Pwjdo5No99XiHxMNeHS6tYGHmdoT3dXx7hmyKIPxqVHbhx72dYjgRRn+oDY
         wetVA72fjuCDv/FYAepb70p5wpFs9+3aoty8WAr8y+uEe39IMcBDYn4DaOHfP71xqWS4
         uOgOO181Az/fi0PMgqkYQ3HV6t1EFu+Y9CZ5WbBTgXSGHodIzxanZhg7pPGywWJoXf4/
         g6afPubuXEPoJpZxxyH+gHwuvMyAF1yJRaKYsK4g/0LB3xJp/RBs3v0XZm1Me3D7VC6d
         3FDA==
X-Gm-Message-State: AOJu0YybOknYkxSWTigBJy2AvKn8/TjR3THRdGohUEciDP7xEszWsQYb
	fcuTFf+9u07b1/Cpfu/hiUchU1fFlyXqsqmiMWdt5E7r11huwqxZWfuH+1a6Cg==
X-Google-Smtp-Source: AGHT+IE7tJUtmyDmEfT88K4d36972vBAPniKC9dO38yf4Vy4usYUldMNxrpkF6RJSBtYWrcfp9uU+A==
X-Received: by 2002:a05:6a00:9394:b0:6ed:21d5:fbdb with SMTP id ka20-20020a056a00939400b006ed21d5fbdbmr1115316pfb.8.1712786424445;
        Wed, 10 Apr 2024 15:00:24 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id n3-20020aa78a43000000b006ed0d0307aasm131148pfa.70.2024.04.10.15.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 15:00:23 -0700 (PDT)
Message-ID: <02400664-2d23-42d3-b49b-0c59f606d298@penguintechs.org>
Date: Wed, 10 Apr 2024 15:00:22 -0700
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
Content-Language: en-US
In-Reply-To: <fca46585-c1ed-4a60-91b5-6da39a5bbdec@penguintechs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_150028_174959_110D1146 
X-CRM114-Status: GOOD (  12.77  )
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

+Johan since he's a former BT drivers maintainer.

On 4/9/24 1:11 PM, Wren Turkal wrote:
> On 4/9/24 1:03 PM, Luiz Augusto von Dentz wrote:
>> 5.19 seems a little too old, imo, or has it been broken for that long,
>> did you at least tried with bluetooth-next? Try contacting the people
>> who actually wrote the driver.
> 
> Sorry, I didn't answer your question. Yes, I do think it's been broken 
> for longer than that, but I wanted to confirm.

Okay, so I tried 6.9-rc3 and every main release 5.19-6.8.

I have found the following:

* older kernels (6.3 and before) seem to be far less likely to kill on a 
cycling the bluetooth service.
* 6.8/6.9-rcs consistently destroy bluetooth when stopping and 
restarting the service
* If I destroy the bluetooth service with a BT service restart in 
6.9-rc3 and warm reboot into any release back to 5.19, bluetooth does 
not work
* cold boot works in all cases assuming I give the laptop about 5s 
between power off/on

So, I suspsect that the process of closing out the hardware may be 
leaving it in a state that the reset cannot handle (and probably never 
could handle).

I also found that qualcomm has docs here: 
https://www.qualcomm.com/products/technology/wi-fi/fastconnect/fastconnect-6800#Documentation

However, I am not a member of a Qualcomm verified company (mentioned in 
the doc links). Luiz, Marcel, or Johan, do you have any contacts that 
might be able to help me in getting info about the technical docs for 
this hardware? I would love to see if I can find any issues in how the 
hardware is being reset.

As an independent dev, I don't even know what it takes to get that kind 
of access. I would welcome any help here. Hey Qualcomm, are you hiring? :P

wt
-- 
You're more amazing than you think!

