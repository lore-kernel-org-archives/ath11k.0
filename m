Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C164CAC5B5
	for <ath11k@archiver.kernel.org>; Thu, 19 Sep 2024 12:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/aPinBNpEQJmGkGlD8UKbnq3igt9GLhQ1nJTLZCt2t8=; b=4bKo6INGaJIDIJICRfY9KNtr5D
	QXFddUTLtryjQF9eXnK3yFXA/tAwr51ScjgQwgYI2+W10EeUT8+Pzklc3CclHcF4lckNBHP0158ZP
	3Q03QJxk0TbeT+GgZOBMyL97GKfTMLkUbC7b6yGW7B9qYAVPiohFBy346eQoJ8Ogf+crrEuC5sPye
	xROyjVDrUDuaOqkcaJlBrVmBmwM9oKU/T54PDXUrm7MfN0/ph6Wmz50izEie7KjKRCtpSlUzQr6fk
	kKeh8KGaJW/iL2zUFNfUA7f+xEDkW2NF3gvLfnZVCtvSTQcjPMFyv/1YV4q9ayCDvkHFlIMiUSTKC
	OqeOhQ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srGAT-0000000AE4m-1E8z;
	Thu, 19 Sep 2024 12:21:53 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srGAQ-0000000AE4G-0iYi
	for ath11k@lists.infradead.org;
	Thu, 19 Sep 2024 12:21:51 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7a9a30a0490so80634885a.3
        for <ath11k@lists.infradead.org>; Thu, 19 Sep 2024 05:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726748508; x=1727353308; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aPinBNpEQJmGkGlD8UKbnq3igt9GLhQ1nJTLZCt2t8=;
        b=Y5MpZ1/ZV1HxsWovqP9p2CEJ4ax55BunRHQMUQxdurAqSQnGxt9Y/UNuubm7zOUwnP
         WAA/TaRkbXXTowpR8hU9ggT8Q/BPyIAV6kai455WUQEzW//8aNqK3TxeeAM+2obNo8ME
         4wunXTYSAodYYOBMxrMxaEWu492MkuR+46W2wdl9Sl7+q3igoEFAkILFzrU0VYpzC4P0
         BOr9XGdP71X13un3pnUI8xhicpgC+eBimoDD7bYyqdXqsZV7TXetPa8GMkST2zYXom7t
         aooNBxq+eeN5R3F6a0JpbS+XSd8UUt4X1vJ1s0eowiyVLuWRV1dYvLPWuXKQbDzlkVdS
         X2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726748508; x=1727353308;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/aPinBNpEQJmGkGlD8UKbnq3igt9GLhQ1nJTLZCt2t8=;
        b=QP/YDGlfVz2K4/uhzGvZacJeyR1+qhP48Cla/hlYUnl0iIIgBDyHOTPcgqLWti1+OI
         vbscfuyhK/9V6Q1BtweRHuOm1+5+z+hCnF3cSUpNEbal9FUeWI7bP1tRLqG0eczsifcs
         mSJyCECrlWudmEhKeZTcpmR+Rh8Ki1BM8jaOg2dg6YjeCMp3FLvBObQ9kr1h5UB865DZ
         cvu6WNRsoUwC4X88xXwlIP5rE1I7KhUo9MNbrDlHriZUFaLXB1JNVh/NQGWytMIOHpCW
         XMO/WUajncHfY0LjagnzU917oaHPO+gtMgPNVjnD7sfccS+rtgKgc1PoEYgoR3xAF6NQ
         Xe+Q==
X-Gm-Message-State: AOJu0YyBU1MTYYt89V5qImVgmiWtCB1A3vGT5IUjihkqNDVNlJi8hijW
	1EL8Kspf0tb5gMgqqdBF4Uhes5MY6SZd39s8NLcqNC0iPEQjxmXi+f9iLw==
X-Google-Smtp-Source: AGHT+IHmlJqFsWyU2FsvDsYsWVtepRrCPdLBdyxSiSA3TMcqUitL7XYEPTVYs6LXteGXk1D3u0Vg2w==
X-Received: by 2002:a05:6214:4a89:b0:6c7:5e3c:ed4 with SMTP id 6a1803df08f44-6c75e3c0f9dmr38936096d6.32.1726748508322;
        Thu, 19 Sep 2024 05:21:48 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b1786961asm7059851cf.6.2024.09.19.05.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 05:21:47 -0700 (PDT)
Message-ID: <eb41d8ec-c4f1-474e-a938-099f27aa94e3@gmail.com>
Date: Thu, 19 Sep 2024 05:21:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
From: James Prestwood <prestwoj@gmail.com>
Subject: ath11k/WCN6855 neighbor report request made immediately after
 connection gets no response (with MFP)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_052150_245324_7F47962A 
X-CRM114-Status: GOOD (  11.05  )
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

Hi,

I noticed an issue when we started putting ath11k clients on a WPA3 
network which seems to be related to the fact that management frame 
protection is enabled (works fine on WPA2 no MFP). Immediately after an 
initial association a neighbor report request goes out and we get no 
response from the AP. After getting a PCAP in one case we noticed the 
neighbor report request went out unencrypted, though still had the CCMP 
IV parameter. The content of the request was the unencrypted request, 
and something like 15 bytes of 0x00 padding. I will say, this initial 
PCAP was made through the AP vendor so perhaps it automatically added 
the right keys to decrypt the frame, this could be a red herring. I 
tried on my home network and it was hit or miss, sometimes I would get a 
response but sometimes I wouldn't, but I did see the frame was always 
encrypted in my home network case though when adding the PMK directly in 
wireshark I couldn't decrypt it, where on other hardware like iwlwifi I 
could.

Some time after the connection neighbor reports work fine. I'm not sure 
of a time frame or delay required that gets them working, but it makes 
me suspect that ath11k doesn't have the keys fully added in the firmware 
before userspace gets signaled as "connected". Running the same scenario 
on ath10k or iwlwifi has no issues. This neighbor report request 
immediately after connecting is IWD's default behavior, so its 
relatively easy to test by just restarting IWD.

Since the neighbor reports work fine after some time its not really a 
critical issue but I wanted to bring it up just in case.

Thanks,

James


