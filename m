Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64801C433EF
	for <ath11k@archiver.kernel.org>; Thu,  3 Feb 2022 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=YS/3V8Mg3j73lg+ddECAGC/sE9Q2yQSHIgggBA4FE+k=; b=is7
	XzcmVpqz7ZcAKHJHjpBX8G+DkTV3wrlAb0kKB1DBqMwFgyenTo7l6bFv/iBL4/FOIGOYcZJLGe2oZ
	dsH9mTXH5dzJH/EdJLIqXom4BvSqcEKYA1PFpcIBN8iK5attrrObDmnPW9Fbuz45l3sxCx/TjIkad
	bkLTIfTBWLs6izHt34GfUjzeWwwvoEe4ud1L4yRKnI9sHxNJj0WHCQDa8Pev1t2IxPDYYrLaf8bsi
	O3LFTWuTyf3R50PlrchAkFUiC2SOJHi17XrgyI/FoxrOsBveuQx7zyMe/1UjdQv3lbg28/LrmbDZo
	rseAsg6D1YFSW+PoCvk+5x7DETpjTLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFdYz-001jiL-1O; Thu, 03 Feb 2022 14:58:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFdYw-001jhe-32
 for ath11k@lists.infradead.org; Thu, 03 Feb 2022 14:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643900295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nFIQJORKe1VrPSbPf6Ar4axa2DI1KeJr+YEzHmxigWU=;
 b=YEVMuNPIITCCsIB7hCcS8csc6Wh4YhkK4CUbZ1t44xpcwhO/3i9QpirMMs54CFRej0CWnm
 ES9lSmn9h+bPMJY/EFBNATPxTSnTjDCAJCl8xI0P7Mgxdllz+MMlY/CdmQRCsUBa5w5Zdl
 65cJQCbwNRhDhC8iaw+k0ol+XcmED40=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-YTl8FWy8P86wVLLA2FYe2Q-1; Thu, 03 Feb 2022 09:56:41 -0500
X-MC-Unique: YTl8FWy8P86wVLLA2FYe2Q-1
Received: by mail-il1-f199.google.com with SMTP id
 h9-20020a92d849000000b002bc4b7993fbso1871194ilq.0
 for <ath11k@lists.infradead.org>; Thu, 03 Feb 2022 06:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=nFIQJORKe1VrPSbPf6Ar4axa2DI1KeJr+YEzHmxigWU=;
 b=AadvWpHJgE3kAXFADpGiTJJuFXD9zge5k+RqbCkvPzfh5SXuUvHPGbUPHrrDylAM1q
 szLRJOK+TWA+GGOWzO8FcB2eqd22OubN9hc+ORYS0a/yWfuO+WyLCKQElr+RIL8KXa6A
 swKpV3d4la7S4Ij3XIKkdgYwfKGkg6646vdzBAssxvlydIzHQ2CaTX0h6QiePlfn/f4l
 YvAAAvSp3qKuzJJhlBqGu78edacX8M9mgHizmaGQUvocX9zRrufEP6+v8JRvHW/2lF6i
 S1YZafpm3ppuSbIIQ+ZGyWH/TBzHf0CcYGKhKnLfgwnL6nr5FLHdrXwdHFZRR0CNtBgI
 db9g==
X-Gm-Message-State: AOAM5335aKoeRsM4ijrYh5uEEYg7aWX4tBPtEaKtDtCtXJ7n9n6ydk84
 XrOn4zc4g8fcC1Y5WQRno4ppK47CgdDc/jDeyv0LU1+FGGDh4dk875D1CabD1I7zq126KByDLCB
 pPqoP1guC1okQzkVo+JPg00Q7KU1MAOgfgMkmwg==
X-Received: by 2002:a5e:8a45:: with SMTP id o5mr18301802iom.169.1643900200767; 
 Thu, 03 Feb 2022 06:56:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMD8+DyOcYmqCK38RxTjGhe6+Xl11uS5WA8BvoDQ1qbZlzPb7kZ3APRKHJ5/hk6t9jP64vPL7Qy60CI4qQIxw=
X-Received: by 2002:a5e:8a45:: with SMTP id o5mr18301797iom.169.1643900200446; 
 Thu, 03 Feb 2022 06:56:40 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date: Thu, 3 Feb 2022 15:56:29 +0100
Message-ID: <CACT4oud4hmkjrAPkOr0sG1DNNgcgQaKT2JNJzcivZey9b5Hpiw@mail.gmail.com>
Subject: failed to fetch board data
To: ath11k@lists.infradead.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ihuguet@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_065818_245072_DCBE12CD 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SGksIEknbSBnZXR0aW5nIHRoZSBmb2xsb3dpbmcgZXJyb3Igd2l0aCB2NS4xNy1yYzIga2VybmVs
IGFuZCBhIFdDTjY4NTUgY2FyZDoKICBjaGlwX2lkIDB4MiBjaGlwX2ZhbWlseSAweGIgYm9hcmRf
aWQgMHhmZiBzb2NfaWQgMHg0MDBjMDIwMAogIGZhaWxlZCB0byBmZXRjaCBib2FyZCBkYXRhIGZv
cgpidXM9cGNpLHZlbmRvcj0xN2NiLGRldmljZT0xMTAzLHN1YnN5c3RlbS12ZW5kb3I9MTA1Yixz
dWJzeXN0ZW0tZGV2aWNlPWUwYjgscW1pLWNoaXAtaWQ9MixxbWktYm9hcmQtaWQ9MjU1CmZyb20g
YXRoMTFrL1dDTjY4NTUvaHcyLjAvYm9hcmQtMi5iaW4KCkhvd2V2ZXIsIEkgaGF2ZSBhbm90aGVy
IGNhcmQgd29ya2luZyBmaW5lIHdpdGggdGhpcyBkYXRhOgpsc3BjaToKICBOZXR3b3JrIGNvbnRy
b2xsZXIgWzAyODBdOiBRdWFsY29tbSBEZXZpY2UgWzE3Y2I6MTEwM10gKHJldiAwMSkKICBTdWJz
eXN0ZW06IEZveGNvbm4gSW50ZXJuYXRpb25hbCwgSW5jLiBEZXZpY2UgWzEwNWI6ZTBjZV0KZG1l
c2c6CiAgY2hpcF9pZCAweDIgY2hpcF9mYW1pbHkgMHhiIGJvYXJkX2lkIDB4ZmYgc29jX2lkIDB4
NDAwYzAyMTAKCkFwcGFyZW50bHksIG9ubHkgc3Vic3lzdGVtIElEIGlzIGRpZmZlcmVudC4KCkkn
bSB1c2luZyB0aGlzIGZpcm13YXJlIGZvciBib3RoLCBtb3N0IHJlY2VudCBjb21taXQ6Cmh0dHBz
Oi8vZ2l0aHViLmNvbS9rdmFsby9hdGgxMWstZmlybXdhcmUKCklzIHRoZSBmaXJzdCBjYXJkIHN0
aWxsIHVuc3VwcG9ydGVkIG9yIGlzIHRoaXMgYW4gZXJyb3I/CgpTaW5jZSBpdCBzZWVtcyB0aGF0
IHRoZXJlIG1pZ2h0IGJlIG1hbnkgdmFyaWFudHMgdGhhdCBuZWVkIHRvIGJlIGtub3duCmluIHRo
ZSBib2FyZC0yLmJpbiBmaWxlLCBpcyBpdCBwb3NzaWJsZSB0byBrbm93IHdoaWNoIG9uZXMgYXJl
CnN1cHBvcnRlZCBhbmQgd2hpY2ggb25lcyBhcmUgbm90PwoKVGhhbmtzCi0tIArDjcOxaWdvIEh1
Z3VldAoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
