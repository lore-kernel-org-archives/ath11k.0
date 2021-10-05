Return-Path: <SRS0=ASgL=OZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE20CC433EF
	for <ath11k@archiver.kernel.org>; Tue,  5 Oct 2021 19:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF6161211
	for <ath11k@archiver.kernel.org>; Tue,  5 Oct 2021 19:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDF6161211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PuXkvijcdgdMNv0w73i9JO5CIPYaXg5BNBhdrieiFcI=; b=1ATZl2Zszn5cew
	9LQDLYCJLPDHzTXURifyLzRzox6e02befursoqYr1ACvZN5twxEs7EGI/zaCPvnf/luRAr/BzMDb4
	iUijNGFIRPa9QCJbF+aQeOeS4xeLeKMg5c3qWUbAmVfhpu2NytW4iPfS8PE1WvoOUMQSkF/NpfsfN
	8dKZOoiQniSug8KydIxdz2+v9GvrqKbA+yLQN4g6yYsFgzbQbnZFydqreKI8Z9DGAZrPrz16otA8H
	TDkU57XbrLCGqZfrHrmQFtW2favPR6J1XdpchQLUCAmbk2upbV+gW2ZzdnRX2eXgs9yq+UAlcyyED
	BwDBmI/ZkgrBS2UQmGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXqBk-00Bf3c-Ao; Tue, 05 Oct 2021 19:33:20 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXqBZ-00Bf1D-88
 for ath11k@lists.infradead.org; Tue, 05 Oct 2021 19:33:10 +0000
Received: by mail-lf1-x129.google.com with SMTP id m3so515793lfu.2
 for <ath11k@lists.infradead.org>; Tue, 05 Oct 2021 12:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=v714AywBE/FULAo7cASQBxwzLaVYGVajKvbpkGZEAa8=;
 b=WMOothVu4zeFHN2uzWtrWtLQPzr2reXiter2EDXKZb+l4c8+pkLqS50d3pb5kaKClF
 SOruDYY5gyGhWEbnOcUkgx0BlVdmlMMIIjf0QNIKpB2Nh928/qNBxGK2G2rj9G1JG13u
 3gC8vR/L5dDdjTs6eU/18waUzVGnxxdvUdodT++Arx4L9giCPzuSwm/zQKS6tz7AANp7
 IoSoxR4MpaowCFxtj9nJtCN4wHbqBQm9awpZr5M9yOhi3G9/oOCBjM/MaWI/yx2QkmUM
 BUKsLLmhVXlzdvUa45uNEIm8ibr0saNkEpKDfCOe6pj/lROEmwl38MzK4NFJRH17h5rg
 7TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=v714AywBE/FULAo7cASQBxwzLaVYGVajKvbpkGZEAa8=;
 b=BBuImSVMsIV4a0G7nNKoXp2G5+KpbNzCRgHc9LJKYSdAGTKA7+YQa+N17+yhi6mICW
 9ei17lFTgV88mroqNdvuALWed0LKK+pgAKWr/DN3mhqm8Pl0Fe0uPcXLAIa97sbUlNH8
 qs0KnBfxehJ/QNgqpKjZuKSnSx/jfUnzpmdB4u7+CZYt6c4xSq3x0ROxbru9lCjDuncU
 klkky9Xv0FU29jpjjpKdr689KxptD7a0OBQhe1Q5rgZSv58JgMVvO/EB6/mD/Nb+23NR
 UhVKfwpakG36HQu4ZOMEszdRf/wg5yotRPUIkue7TBgLp408ikgvV/uGwkvAgfhslteI
 /9Fg==
X-Gm-Message-State: AOAM530jchaFzRY2aDmiSG7D0JHOqEcLqwj41+X9Bstys3KQ655/Dnuk
 /yHouLaxyXqnJ/p9+vMyZ5POavH9t2dMaDLy
X-Google-Smtp-Source: ABdhPJwKsf/8gWNkGWBaN8AcDOAKpM7MLKvIKC1cbsOGysvtl6/Aqkr2NMfdwtIyuzPy2yDyeBJrew==
X-Received: by 2002:a05:6512:ba4:: with SMTP id
 b36mr5206226lfv.177.1633462387071; 
 Tue, 05 Oct 2021 12:33:07 -0700 (PDT)
Received: from [192.168.2.114] ([109.106.141.149])
 by smtp.gmail.com with ESMTPSA id i25sm2046946lfc.105.2021.10.05.12.33.06
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:33:06 -0700 (PDT)
To: ath11k@lists.infradead.org
From: Mark Herbert <mark.herbert42@gmail.com>
Subject: Can not unload ath11k_pci and load it back
Message-ID: <190a1b14-0a8c-f1fb-9f0d-e25cc57034a7@gmail.com>
Date: Tue, 5 Oct 2021 22:32:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_123309_309937_92B43749 
X-CRM114-Status: GOOD (  10.06  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

RGVhciBhdGgxMWsgdGVhbSwKClRoZSBtYWluIGlzc3VlIGlzIEkgY2FuIG5vdCBoaWJlcm5hdGUg
YW5kIHdha2UgdXAgbXkgWFBTIDEzIDkzMTAuwqAgSWYgSSAKa2VlcCBtb2R1bGUgbG9hZGVkIGl0
IGhpYmVybmF0ZS4gQnUgaGFuZ3Mgb24gcmVzdW1lLiBJZiBJIHVubG9hZCBtb2R1bGUgCi0gaXQg
cmVzdW1lcyBPSyBidXQgdGhlcmUgaXMgbm8gY2hhbmNlIHRvIGhhdmUgV0lGSSBiYWNrIHdpdGhv
dXQgcmVib290LgoKSWYgSSBkbyBybW1vZCBhdGgxMWtfcGNpIC0gaXQgc2hvd3MgZXJyb3JzIGlu
IGRtZXNnOgoKW8KgwqAgNDguODAxNTA0XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogbGluayBk
b3duIGVycm9yIGR1cmluZyBnbG9iYWwgcmVzZXQKW8KgwqAgNDguODAxNzAwXSBETUFSOiBEUkhE
OiBoYW5kbGluZyBmYXVsdCBzdGF0dXMgcmVnIDIKW8KgwqAgNDguODAxNzA5XSBETUFSOiBbSU5U
Ui1SRU1BUF0gUmVxdWVzdCBkZXZpY2UgWzB4NzI6MHgwMC4wXSBmYXVsdCAKaW5kZXggMHg2MCBb
ZmF1bHQgcmVhc29uIDB4MjJdIFByZXNlbnQgZmllbGQgaW4gdGhlIElSVEUgZW50cnkgaXMgY2xl
YXIKCklmIEkgZG8gbW9kcHJvYmUgaW1tZWRpYXRlbHkgaXQgZG9lcyBsb2FkIG1vZHVsZSBidXQg
Y2FyZCB3aWxsIG5vdCBjb21lIApiYWNrIGFnYWluLgoKSW4gQXJjaCB3aWtpIHJlbG9hZGluZyBt
b2R1bGVzIHdhcyBleHBsYWluZWQgYXMgYSB3b3JrYXJvdW5kIHRvIApzdXNwZW5kLXJlc3VtZSA5
MzEwLCBidXQgbG9va3MgbGlrZSBpdCBkb2VzIG5vdCB3b3JrIGFueW1vcmUuIFN1c3BlbmQgdG8g
CmlkbGUgd29ya3MgZmluZSAtIG5vIG1vZHVsZSB1bmxvYWRpbmcgbmVlZGVkLgoKCktpbmQgcmVn
YXJkcwoKTWFyay4KCgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTFrCg==
