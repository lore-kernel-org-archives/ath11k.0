Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10882C3DA4A
	for <ath11k@archiver.kernel.org>; Tue, 20 Aug 2024 19:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iLic+AT+//cVj0cZOJRFLjyIWDzxE52raEf6fUVZQ1U=; b=NIl/4dukKSPU66BUcAd+z0WPyQ
	HGbit9x54DOKCwCtha38wSUPQVFqFWgkEeUiNkUkoy7LuvfRIFKx/rBeB30OBjKio+QjoaPbBb3Tx
	9TKsNG6Y1WHSX5FaTbYsPzzkD9TVfwMHIy/Qs5ynjEeBtuIaU8vBCdKmFHfllCXAJof6KRcEA4x9j
	JV54YCCCCWRoVDBFu30lRyYOE9aGXX9fRCbbnegBzTpmuX0oieltd+TJzN2IVg6YIKlFMWBhg+sBo
	KxjVv05/ac31qRMdNnYduINtNReVblDcc+7cDP7Hzhbl3oHb1zfOTv51rNjHHAwBuP8bCONvh2nap
	fH0prHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgUAs-00000006PdK-3gGm;
	Tue, 20 Aug 2024 19:05:46 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgUAP-00000006PXf-2WDO
	for ath11k@lists.infradead.org;
	Tue, 20 Aug 2024 19:05:19 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7a1dea79e1aso350393685a.1
        for <ath11k@lists.infradead.org>; Tue, 20 Aug 2024 12:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724180716; x=1724785516; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLic+AT+//cVj0cZOJRFLjyIWDzxE52raEf6fUVZQ1U=;
        b=AsQa1NiN3dHnDgapxHxOdGG7hVaM9Qt64jNMKlt1qApAKX9HLkjmUW49ZdJCADmn3L
         Y3qudOIZ8Hx7u8nQdDWVIhF4ZgxYAOqCouD6MCMGsISWeqqcYVdl30ljwm9hkxyf1BgI
         NHRkjlT8p1sMgm7EtDxywU/MjXjJb1YpGA4D8GqDFjftagF1LokKH3B6gCRnTT3MSWCG
         hT/xRBmrU6QfmziH1BeZ+xSV0PYXlXJEj7/D26meh3tTcUsy33067JA0RCsc40kluG7F
         +8LIDhi3KvLthWaLOTZMpcCu1hiqvjXjFm7GLpHQTXOk6DSIgUgyDKjZwxc+QGSejC1C
         qphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724180716; x=1724785516;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iLic+AT+//cVj0cZOJRFLjyIWDzxE52raEf6fUVZQ1U=;
        b=CJt8NasU1xjICso3TQvO8Kq3jS3z87irGB33rqmgULC9rhut2gPADdmWIUhwvYhlCS
         eOmBuqcLa60Ky000uxZBsTWy4SYjwYlfGtbvzeUFqpq38Q6LUuQAGvmjQ5agbC+IzS5c
         TlcADkl9OVmpH1nHkXlL/NlU9Yy3Yk+08dDcT48M2LrKOMuWVInH5Y5gJT84YoVHrSeu
         KygoPGnEhCNk+JoXXXWS8PMzcgVmKX7dYnZR5VjFcncPeJ8Sq0KtbbdvmgWWAzujn+cd
         /kng32/l9jwKZ21YcZnfWWlMMbZbKtEhbZXKYOZFSvnSdayw7KqodhV2+OUd2oWV325n
         4i1g==
X-Gm-Message-State: AOJu0YxWLj29MpH76ezl/dqBPEP5G7jwbsWXg1OVkHyLIIYOXqVN5vMg
	CiGTHlHO1Z1TWYgg5hJuhCqVexHGILD3IAhxo8SjbJ0u1JQi5UxFm3x9dQ==
X-Google-Smtp-Source: AGHT+IE4EUSb0Q54nr+ylscpyjsdf9T/AVwpMTaCxRlWZGgJBcK/tPJJZhFk7ZB+5X9uk8/QX23xjg==
X-Received: by 2002:a05:620a:470b:b0:7a3:7889:4af0 with SMTP id af79cd13be357-7a6748f824bmr8297285a.28.1724180715517;
        Tue, 20 Aug 2024 12:05:15 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff0e555asm551681085a.79.2024.08.20.12.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 12:05:15 -0700 (PDT)
Message-ID: <3b8c7d73-3e2e-471a-8434-61322a5746fa@gmail.com>
Date: Tue, 20 Aug 2024 12:05:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
From: James Prestwood <prestwoj@gmail.com>
Subject: ath11k WCN6855 seems to have incorrect regulatory info for US DFS-FCC
 (no 6ghz)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_120517_694568_5637BB50 
X-CRM114-Status: UNSURE (   6.23  )
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

Hi,

I'm using the latest firmware for ath11k [1], WCN6855 hw2.1, and so far 
I guess we've been lucky that the regdom has always been set to 00, 
which apparently allows 6ghz. But recently we have seen the regdom get 
set to US and it then has 6ghz disabled:

phy#0 (self-managed)
country US: DFS-FCC
     (2402 - 2472 @ 40), (6, 30), (N/A)
     (5170 - 5250 @ 80), (6, 24), (N/A), AUTO-BW
     (5250 - 5330 @ 80), (6, 24), (0 ms), DFS, AUTO-BW
     (5490 - 5730 @ 160), (6, 24), (0 ms), DFS, AUTO-BW
     (5735 - 5855 @ 80), (6, 30), (N/A), AUTO-BW
     (5855 - 5925 @ 40), (6, 30), (N/A), NO-OUTDOOR, AUTO-BW

I have updated the regulatory.db from wireless-regdb.git as well, and 
updated all the firmware (including regdb.bin) to the latest available. 
According to the wireless-regdb tree, US: DFS-FCC _should_ allow 6ghz [2]:

Is there something I'm missing here?

Thanks,

James

[1] 
https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/WCN6855?ref_type=heads

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/wens/wireless-regdb.git/tree/db.txt#n1895


