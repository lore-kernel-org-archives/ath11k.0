Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25916CF8840
	for <ath11k@archiver.kernel.org>; Fri,  4 Oct 2024 18:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DTlO8u4SEvc+ukyFmrhTzrzHYiAD7mqkad8uygUfBik=; b=u+r+jKhMHm+Mz63PUr8PM7D5Le
	7sD5Qzovdm0Uhb9hRJR/57SwmbBykzyAZv6Qhk5K6wLORkrpcUjojWsyGdRGhW0hYTo1XHFdreUM5
	ECRmWVfvztZE+VmezN0QBs563x6vnGr+KC6xuhs4UF0upzomZZpQ8XB1yPmpWMj8y0492U3qpYKKS
	p6mVfQFg6rA3uFtCSn0yEu8yeGIFNZ6lZHjYncgaQg09bV9m4CEa7Ptcz4d0dkNmceGCrn81c+1An
	eJm+XAnfTjn0ZMguLj+Fe17KD5WBpkXBYqwtZK1soPqr0wneHQBcSltGFlv2Te/5mf2vT4oOWrj/u
	/9o4cOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swnKx-0000000DlND-1kIp;
	Fri, 04 Oct 2024 18:47:35 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swnKS-0000000DlGG-06Ee
	for ath11k@lists.infradead.org;
	Fri, 04 Oct 2024 18:47:05 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6cb2aaf4a73so20874456d6.2
        for <ath11k@lists.infradead.org>; Fri, 04 Oct 2024 11:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728067620; x=1728672420; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTlO8u4SEvc+ukyFmrhTzrzHYiAD7mqkad8uygUfBik=;
        b=LDl2kW6cwTuMPtVa8EsPwqAtA3C2u/UtIPCw6QNcGYEnBcCJJNyzXtHsNCCLv4odVd
         vQYglEzqr0c/5xrGGLEeaH4iifsHZvtHA+5A7F5MGfTZfwjrvtHGZYO0Z/iRYBntLIRU
         O2u0/S18R9drtlbc5ZO7dmaS0mr4ePJYy1eW2VGYjbqhZ8BFz9q2Xz/U55CkJ0Dn4D/B
         Z7ZWnHmbnT+TXHXMfZdupxUkVKYxQvB208BowzucqyRj4gN4/R3sPqsSLitet2Yfe5ST
         YlPsf0db02LG8GBYKnl3L5zx7PDVp/LEBAoAhz5u/eK+IhaB1T9Ya/mvabzrYRnnpFt0
         zGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728067620; x=1728672420;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DTlO8u4SEvc+ukyFmrhTzrzHYiAD7mqkad8uygUfBik=;
        b=fXnWRud6VntWFWyMjsrgfAPHh/j7Os9mOlH7xywnqW8LthFCkMu9RhkeDbhSbb3EmU
         pcx7jORPYt8EtgNpOxj7pIZlX+SGl0kz62AJgkBB6A+NEwbZm9iJNfESyUClaT5Xl61g
         avR5RFR0gaBzpx/xag0iPJyeVyju7dWCBBWYzk4SxtV9zkDj2Yfg82ybFIgMTy4Cvboj
         m9nZwJKbsmDvj6NCy4UZR4wu1CH8TUXN2NOyAx/9vbLVUcu3l4AU1vNLA13mTbz/2GPy
         E3I7bsCWfMwSxRConUv5xOqAcXfPfGOjn5csmZ61rMrWCMklCQ3M4t+gqMbtta9phw1W
         U8ZQ==
X-Gm-Message-State: AOJu0Yw0opFj06L8JtSrIA9BQRHMGxZ2nqy+jr0eCrDaxUns+x25v8Jm
	21jwAU/pmNv7akIRu10VswymuT3ZsAcZFPVPsVbra5UzKpAW3MOD
X-Google-Smtp-Source: AGHT+IEzfSwzQufxcJwvFUXmoKY5QYcdi8XL1Sx7wtH5g4iIFGIERTFZNS16Djx9Kl60oYRoB7sWZw==
X-Received: by 2002:a05:6214:568e:b0:6c5:517a:56dd with SMTP id 6a1803df08f44-6cb9a308e43mr48331246d6.16.1728067617317;
        Fri, 04 Oct 2024 11:46:57 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46cad28sm1657486d6.18.2024.10.04.11.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 11:46:57 -0700 (PDT)
Message-ID: <cfb00919-678f-408d-9fb9-83fc24fee197@gmail.com>
Date: Fri, 4 Oct 2024 11:46:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
From: James Prestwood <prestwoj@gmail.com>
Subject: Missing scan results with SCAN_FLAG_COLOCATED_6GHZ set
 (Ath11k/WCN6855)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_114704_098823_5643431F 
X-CRM114-Status: GOOD (  13.75  )
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

I've noticed that when setting the colocated flag much of the scan 
results are not appearing when they should be. This was seen in a large 
warehouse where our network/SSID was using only the 6ghz band. There 
were other networks on 2.4/5ghz though, which maybe is having some 
effect, but those networks are not broadcasting on 6ghz.

This first came to my attention when the majority of our clients were 
experiencing horrible signal quality. Upon looking at the logs and 
nl80211 messages to the kernel IWD was issuing both limited 6ghz scans 
as well as full spectrum scans and only showing a few 6ghz results, like 
1-2 BSS's which should not have been the case. I was able to scan 
manually using "iw scan" and I saw all the expected BSS's. I isolated it 
to the fact that IWD was setting the SCAN_FLAG_COLOCATED_6GHZ and 
removing that flag resulted in all the BSS's showing up in scan results. 
Note, that with or without the flag all the 2.4/5ghz BSS's were showing 
up without a problem, it seems completely isolated to the 6ghz band.

The NEW_SCAN_RESULTS event was indicating the kernel had scanned all the 
expected frequencies we were asking to scan, but the results were mostly 
empty for 6ghz. Only ever the connected BSS would show up and 
_sometimes_ another BSS, but generally not.

I'm trying to read through the code associated with the COLOCATED flag, 
but its not exactly intuitive (to me at least). I'm not sure if this is 
something with mac80211 or at the driver level. I really don't have 
anything to compare it to as ath11k is the only hardware available at 
this warehouse with many APs around.

I'm looking for some guidance on if this is expected behavior with the 
colocated flag, and if there is any concern with including it 
unconditionally on every scan. If it has unintended consequences like 
this, generally, across multiple drivers I'd like to re-think its use in 
IWD.

Thanks,

James


