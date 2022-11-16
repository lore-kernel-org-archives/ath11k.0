Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B85C4332F
	for <ath11k@archiver.kernel.org>; Wed, 16 Nov 2022 15:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p3iapUdn9LnlVjcieckSXnIFX2HnQFNoOt4uJNAGnN0=; b=WUS2TzkM8o7I/M
	J1L0oiKMKRZRlCZbzN3ACmHNm2d/SjArn8+vbRcbV8IiLbSpLAZJFI6y98y9h5DDHpjlNU+G18PaD
	onrdODyna/w82n/6ErhiYD2Eefxxa/EXh8N1joH5xcY4+xEdiSRIngRMnUivserhkUfYhQMvybUl1
	KguYbWQs8Wlglk0tXTg77uZThqx+Gkby7n9De0IR10+3CJveL1aLvdszUXIh6v7MStea1KNZyMhK7
	ccXh/5yGuZL81zLeMAcD+f2aX9v+zCcRW7idYjR0H7zhXM+VvfwJH1SnhuDzWrvFjDWHvTH0kKF4v
	tI2ZDFwcrnq2trq1VLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovK0s-004wT3-3f; Wed, 16 Nov 2022 15:07:42 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovK0p-004wOz-HH
	for ath11k@lists.infradead.org; Wed, 16 Nov 2022 15:07:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id i21so26990265edj.10
        for <ath11k@lists.infradead.org>; Wed, 16 Nov 2022 07:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+QEevexRcENw52T34c19MDyUJECBTM3YJB7aJy2VLi0=;
        b=ZA2+wcmmQJYbU6MB2+nvwTGEO4gVR4ksroE1ZMSXmrUFaMNjzISSKO0lrNmUHUz0bY
         wKQboh6Gnf1knF+EEE/XrPy6B/KGPKgsY/lr+BHlM+jmSyZhx6wRiyR9RlRo4dYzDPQb
         rI6/NXlDsZ7eAH5KKrnGSEYRqpCL7vUY2zSZgOmLSloiv0aYW+MjZgGva8NPYv6wbE65
         nyhYfVKVuM4sL12+DuZRe1j11pzW4PsnoDJNqTT6hVWbkBmhvVXT3SOx/M4bKtUNaggt
         6IhzL1fAyrQ/GyuG55uXS/jbpVSKx8xLMOWutFCGiLKz+6Pfo4fnR/c/V7f7Ns0/rh7p
         uz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QEevexRcENw52T34c19MDyUJECBTM3YJB7aJy2VLi0=;
        b=UWdmNmIjFet/jSLdNIlp3s3KqeeSfPg6ltRsu3WOepY9qZu+uMFZTu18stoAiep426
         qi2z/dXnNMwkjaOYYb5Mh9trIT8yDQjmhNTHxx9W+2duDgJ7ZW4c0M+F81UtYfvWNVC8
         bSq8WQQXBuBypTtNn8UbHmHLBWSVH5/zeAsiXK9gW4a5l6++sW383ZRaVfcLEURSa8qA
         Dqu0R5c40YmyhlBXmkBd5zUWuw6PcGIpxuqJO4ci8Hza4o6Q0bbALC5jH5+qk0ahG4Gj
         fiUnMVHzl6V3CM9Y3Joy9bvqITCR1DbnYLaMI2VRyx1yPeLh86wIVb/wLiXKjjFTJ/Ah
         352w==
X-Gm-Message-State: ANoB5pnU7DfO/xj681+F8WIfN43F3hkOT2uM8rCfIc50H3xne0um2xfq
	BvZdOvgRUlqF1S8SkvwwKs33w8/gKMeXKTcn
X-Google-Smtp-Source: AA0mqf53C/EupSXuy6uwftLVOq697SgDEtUlZfxPU9zRZ7bMtCj/O4x/d9X1G0EIY4P2/AOQMAV6dg==
X-Received: by 2002:a50:fd91:0:b0:463:ff10:4ff with SMTP id o17-20020a50fd91000000b00463ff1004ffmr19976981edt.290.1668611254155;
        Wed, 16 Nov 2022 07:07:34 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id qq18-20020a17090720d200b00773f3ccd989sm6943290ejb.68.2022.11.16.07.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 07:07:33 -0800 (PST)
Message-ID: <34956280-4716-d24e-1b2e-01be3366b605@linaro.org>
Date: Wed, 16 Nov 2022 16:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
To: ath11k@lists.infradead.org, kvalo@kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: WCN6885 crashes on Xperia 1 IV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_070739_611688_D9B1B585 
X-CRM114-Status: UNSURE (   6.98  )
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

Hi Kalle, Dmitry

I recently got Wi-Fi to work on my SM8450 Sony Xperia 1 IV (with the 
help of Dmitry), but I can only get it to function using very old CrOS 
firmware [1]. Linux-next fw breaks for me in the same way that it did 
for Dmitry here [2]. There is however also the fw shipped with the phone 
(not sure how redistributable it is, you can extract it from the OTA [3] 
update by running simg2img from android-tools and mounting it. You will 
find it in image/):

- amss20.bin (renamed to amss.bin)
- m3.bin
- board.e[0-9af] (Dmitry gave me a hint that I should choose board.e8d 
based on the reported board_id; renamed to board.bin)
- regdb.bin

Using this set of firmwares I get a veeery long and unpleasant set of 
crashes [4].

Any ideas where to start tackling this?


Konrad

[1] 
https://chromium.googlesource.com/chromiumos/third_party/linux-firmware/+/d233ddd89abe06448070471963a58c0a7da81d79/ath11k/WCN6855/hw2.0

[2] https://bugzilla.kernel.org/show_bug.cgi?id=215987

[3] 
https://drive.google.com/file/d/1gBkKplxUJuoUab71HMTLdf55jIl-ieoH/view?usp=share_link

[4] https://pastebin.com/ZF8ks51p


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
