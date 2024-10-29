Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B213D3A67C
	for <ath11k@archiver.kernel.org>; Tue, 29 Oct 2024 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peLewp1sDkMwipX2ISx55lk+Ut2hUtkzlKk5syTtSII=; b=qHHeXuNTP/XteFAwXgWp3NIZzJ
	lZUG8GJowHm9oTQvEZ/LUmjULkeJBQPpwLx2LF7nlVVHSTDDfa7KApuvwoLlEeOeRCBiRrb1PexQ4
	Do1xEVab6e0I0nJqH/I30iGkWar6Pq99gBFY3nQl5P6rUcG+Sw3zbr2EOoK4gi0GSdt/q1Jif7dl5
	/P4RX5iRzquZ5PO0CU3nddX4o2mMMlFUuIQvYKRuIst8ej2xoUMp8KND/5/k7cWCl8zTThd/pCo7G
	dwg86tzLRVkbEh8q3i0iEh599H0+AvelWR7FyNhilI/VNLIfV0HoJUQ2bX5s/OVW7gQyTbT+ud3CU
	s7DSZuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rFI-0000000FY4W-1Gps;
	Tue, 29 Oct 2024 18:47:12 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5pFh-0000000F9Ni-1TLy
	for ath11k@lists.infradead.org;
	Tue, 29 Oct 2024 16:39:30 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5daa93677e1so2904549eaf.3
        for <ath11k@lists.infradead.org>; Tue, 29 Oct 2024 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730219967; x=1730824767; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=peLewp1sDkMwipX2ISx55lk+Ut2hUtkzlKk5syTtSII=;
        b=A39rf2Pksv2jWO7CDbemwf7937HPxzxpa549aGbmE9G1iplukv4/THfdcWaL1BeUjj
         c8JEhg6RmTo230zRFRvJem/fQZZHDWl3Ox2OoYKwqTQnYS5QFmNEkjB2FMwBl45hUA4D
         gu0cjAOdrTCzmJe5iJ3drkNi+0mKhgjaE0Oxj+iJH3OIz7psyXiAig2F+0NS3as+XQLb
         /gPl7FSpjw68APNJAtLpATRVy1NqZkpQkatZCBtTeb3qbn47hZ8ipMGqQsjXNhOtf2+v
         j5FyYZSNMgAr7IF875b6mURl64t6YcLD2/gY+BKYgPhtoBmhtsQ8vCZFPjnw3ZGkGY7B
         tOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730219967; x=1730824767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peLewp1sDkMwipX2ISx55lk+Ut2hUtkzlKk5syTtSII=;
        b=n9x6uNZXb0ppbO74PvXtTEZtRV9oNLZTA4eAoGE/hVPnj7ClddQfPOFyFH/WiVkoTS
         6vEKn5mUhFbNYL5nDiqzjhhuq/UR3WTQqhqiG51tYUMkhcl/HMqXAUoUiy67a53a4vC4
         87GWxB+P69QpJd6fRF6f94hQmYCmZavgoTiGiLSHImTFe2+3dW6Py0eoWXC7RWCvpPkV
         iKTZBc8jFsF+KPrJWEBjPwgL0pUoQGyd+5+7IG5VT0VozuZjgdPBlW0ml1NSjLLkJ5Ce
         Wh8iI9e+sbOnzCFY6gcW9uqTmgZ1h+PLkAcna3WYnM/ks3BTlbON015J1EEAx/HtyCkh
         i0jA==
X-Forwarded-Encrypted: i=1; AJvYcCXNVrwOHUrPcIfzuM+BwCbgCnXPUpVLW5Ktiu7Kc3GbJ+KJGW9XqHKZJ45OLN2cu0OoniCKeCk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzF/KNqL/ePt+jyw5bzZqK8kbmQJy/oIaqtGK5GffPfAVJNhA2
	Bw+cvXkYINnYXTSUtuRJzJLvbHbbxlJt2D+IzRn51yOA51cEq5ut
X-Google-Smtp-Source: AGHT+IGEp4YmFbKV+LZMOpct2FxzPuGoEDiWRRfLVT7CzOBL6+lUtgb+KzFVILVVimeA8HzgKES9tw==
X-Received: by 2002:a05:6820:16a5:b0:5eb:c6ba:796d with SMTP id 006d021491bc7-5ec237dc6d4mr8959912eaf.1.1730219966428;
        Tue, 29 Oct 2024 09:39:26 -0700 (PDT)
Received: from [192.168.1.22] (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-5ec186fc10bsm2370619eaf.37.2024.10.29.09.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 09:39:25 -0700 (PDT)
Message-ID: <5daffb96-74c0-49aa-ab31-f94a04b8e873@gmail.com>
Date: Tue, 29 Oct 2024 11:39:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: State of multiple PCI(e) modules since 2022
To: Mihai Moldovan <ionic@ionic.de>, ath11k@lists.infradead.org
References: <588735d6-d30d-4d9c-ba43-6a10d85786d8@ionic.de>
Content-Language: en-US
From: Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <588735d6-d30d-4d9c-ba43-6a10d85786d8@ionic.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_093929_422107_2D9561E5 
X-CRM114-Status: UNSURE (   4.54  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Mihai,

> For the past 15 years (or longer), I've been using two ath9k-based cards in a 
> machine, without issues. Granted, they didn't need external firmware, and didn't 
> use a complicated layered PCI/MHI/QRTR/QMI setup.

This RFC might be of interest then:
https://lore.kernel.org/all/20241018181842.1368394-1-denkenz@gmail.com/

Regards,
-Denis

