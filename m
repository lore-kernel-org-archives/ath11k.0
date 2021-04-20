Return-Path: <SRS0=YHSM=JR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D4AC433ED
	for <ath11k@archiver.kernel.org>; Tue, 20 Apr 2021 10:43:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C5CA61164
	for <ath11k@archiver.kernel.org>; Tue, 20 Apr 2021 10:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C5CA61164
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hctODJsoHBRFKp3mj45gx32PZcWLm2H/pBF1YsMDom4=; b=bqZZHXQpcmJdGT
	HIfM/KC9XrNgCOeFL7J8IHrw/S8BljwR1h+HN/ZHaUflLILebcjy6SYXhkCopYtuS4oYBMo3B+oGr
	xJblgz920bnxJZNDAD9mvZN8p2fCGelDJAmqGmRqQ298xOcp5LKsEnrsRhmdmCDxFMUU9xIuqHtp2
	FFqBZvOjFroh4L75pNxB45p80g+/LHT1/SgU6H/6AtemhmOveuLxQLjFQUagyWsMFbnKOA+mrUnjK
	vI22lYzQjm7Kvvtes0/xyTBnvmGn9MHXtT/4fkQ3pynpzMO6oDYJsyr2ugQLjEh6hzRmjncdXYQnA
	lvQkqySSXm1tvEBVKR8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYnqL-00Bu53-OP; Tue, 20 Apr 2021 10:42:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYnqK-00Bu4v-Fk
 for ath11k@desiato.infradead.org; Tue, 20 Apr 2021 10:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=tg88M2kWtoM42m8akT3RRng/fbQHt13g6bEqpLBK4rM=; b=fHQ1e/tEA+DJvm0yHuduGRC93h
 rZwrYhTRYrhXGwEohyOrFJck7jq4wP6MO+vWzGd0TCf8Q2xbvWLL2TIfTeBtHpl09c7xunpjS7S+Y
 GF9ZBcBRxW48fHI/A3OX/Hbg5sd/B63636ZpvemPY9vND0uF3r7C59rxRVlPeIjhoAVjI2/pyEDaJ
 eXQ5KFSVX9hue6cbU/NG6driyaPP9cS8Ul22bmTNRCsTUsZCUQ1QSTpZd3KoJKPcOUY9TlR/cEqvB
 nx3L0S21fcFtTTeRF8Srp0bqnC9gcLpDzUlEd74HUbG4fzESwBoop5w3Svl0K5PMNAnxkSqYZiDBD
 FuWPBRhw==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYnqF-00C22u-5I
 for ath11k@lists.infradead.org; Tue, 20 Apr 2021 10:42:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id z5so7953631edr.11
 for <ath11k@lists.infradead.org>; Tue, 20 Apr 2021 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=tg88M2kWtoM42m8akT3RRng/fbQHt13g6bEqpLBK4rM=;
 b=HH5c/SmABIS5/n0IFX7iuBovFY2Xd2YILFpgPbw5QnffwhU0uiZBw3LTt1C2EXb9A8
 7auHcPBRLnu0H+2ZqC3pUvFf5thKT03YQn4m8dtw04LuaOPBH4ukmJevacK7M1s44Gp7
 LvWxkjXGESGFnkj4txGSDBPpb3dIsgkK5CiaWUTK2UvTbWA8hk4oi1Lt7i0qnuy1R7dg
 SpdCHOgn58wmXhEzjOjicpV6Vfk2/czhVLGNOnSLn7wCD6gSP/lD3bQIu8zBACwhc2GB
 qVnFCplgJPhbwEGZTTUE2OAqIZp9sbr3V5LdnZMkficNSxBNFYzk6/2BSJpU+AzooV41
 viJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=tg88M2kWtoM42m8akT3RRng/fbQHt13g6bEqpLBK4rM=;
 b=VNeIoRJmIe1Q46VgURCrEztygIh9DhpqNIwgXqsxhkoDMCvfzmxn9xvdLDC6Egg2Y1
 BY/JZ1qiGIabvfGhp02Vs6C2X5aSsG9SlSciSnx3apoJGEOyi5ZQilIRjLgoyiuArwyr
 8xBPwsNR5TngET+VMAA5s/++XYzDGb1+oDIV7hdG9ZfRjZ15ysNdQOTJxvrnMERFbfzn
 jCP1f6f4x3Dkih8YpSbZDy31mxs1Wt46REr/LhM/3ZXOAJLwQH9cFzV1CmTuhjeCoi7F
 ocZb2BEmiinsI/JKE3WHB3TXRSklNHNN1x8lN3TuEtIH0OklfQ4tECBLHMePfrX5qwTl
 ZiFw==
X-Gm-Message-State: AOAM532cK759d1K4/uikvgTHUP1Ygndblau8ozzfWu/GwjzjWGifo3xJ
 94i5LRa4QeUiccIW+Dz+8OjmX4N/Ow0=
X-Google-Smtp-Source: ABdhPJwOX7TVHrRL92c81ruhSMd/EgGJzPhg/CRCNJEgKFlE347XbD9a0QhW7cf3Ve7FoShCMexlyw==
X-Received: by 2002:aa7:ca04:: with SMTP id y4mr31067531eds.72.1618915368598; 
 Tue, 20 Apr 2021 03:42:48 -0700 (PDT)
Received: from ?IPv6:2a02:2454:398:1d00:ba32:a1f9:abcc:fdca?
 ([2a02:2454:398:1d00:ba32:a1f9:abcc:fdca])
 by smtp.gmail.com with ESMTPSA id hd30sm8564612ejc.59.2021.04.20.03.42.48
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:42:48 -0700 (PDT)
To: ath11k@lists.infradead.org
From: Jan-Philip Gehrcke <jgehrcke@googlemail.com>
Subject: crash in ath11k_mac_op_unassign_vif_chanctx / kernel 5.12.0-0.rc7
Message-ID: <5b80d6b4-2956-0213-eeb8-c2229c7ec67c@googlemail.com>
Date: Tue, 20 Apr 2021 12:42:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_034251_246983_11D1CE34 
X-CRM114-Status: GOOD (  12.99  )
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

SGV5LiBJIG9yaWdpbmFsbHkgcmVwb3J0ZWQgZm9yIEZlZG9yYSAzNCBhdCAKaHR0cHM6Ly9idWd6
aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xOTUwNDEwIGJ1dCBub3cgZmVlbCBsaWtl
IAp0aGlzIGxpc3QgaXMgbW9yZSBhcHByb3ByaWF0ZS4KCkhhcmR3YXJlOiBEZWxsIFhQUyAxNSA5
NTAwIHdpdGggbmV3ZXN0IEJJT1MgKDEuNy4xIDAzLzI5LzIwMjEpIGFuZCAKUUNBNjM5MCBXaXJl
bGVzcyBOZXR3b3JrIEFkYXB0ZXIgW0FYNTAwLURCUyAoMngyKV0KCktlcm5lbDogdGVzdGVkIHdp
dGggYm90aDogNS4xMi4wLTAucmM3IGFuZCA1LjExLjEyLTMwMCBmcm9tIEZlZG9yYSAzNC4gCkZv
Y3VzaW5nIG9uIHRoZSA1LjEyIG9uZSBoZXJlLCBidXQgdGhlIGNyYXNoIGluIAphdGgxMWtfbWFj
X29wX3VuYXNzaWduX3ZpZl9jaGFuY3R4IHNlZW1zIHRvIGJlIHRoZSBzYW1lIGluIGJvdGguCgog
wqAgJCB1bmFtZSAtYQogwqAgTGludXggZmVkb3JhIDUuMTIuMC0wLnJjNy4xODkuZmMzNS54ODZf
NjQgIzEgU01QIE1vbiBBcHIgMTIgMTg6NTM6NDMgClVUQyAyMDIxIHg4Nl82NCB4ODZfNjQgeDg2
XzY0IEdOVS9MaW51eAoKS2VybmVsIGxvZyBleGNlcnB0IHJpZ2h0IGFmdGVyIGJvb3Q6CgogICBb
ICAgMjcuMDkzODAzXSBSSVA6IDAwMTA6YXRoMTFrX21hY19vcF91bmFzc2lnbl92aWZfY2hhbmN0
eCsweDE3ZS8weDFkMCBbYXRoMTFrXQoKICAgWyAgIDI3LjA5Mzg3Nl0gQ2FsbCBUcmFjZToKICAg
WyAgIDI3LjA5Mzg4NV0gIGllZWU4MDIxMV9hc3NpZ25fdmlmX2NoYW5jdHgrMHg4Yi8weDQyMCBb
bWFjODAyMTFdCiAgIFsgICAyNy4wOTM5ODldICA/IGF0aDExa19tYWNfb3BfYnNzX2luZm9fY2hh
bmdlZCsweDNjLzB4YzYwIFthdGgxMWtdCiAgIFsgICAyNy4wOTQwMTddICBfX2llZWU4MDIxMV92
aWZfcmVsZWFzZV9jaGFubmVsKzB4NGYvMHgxMzAgW21hYzgwMjExXQogICBbICAgMjcuMDk0MTAz
XSAgaWVlZTgwMjExX3ZpZl9yZWxlYXNlX2NoYW5uZWwrMHgzYS8weDUwIFttYWM4MDIxMV0KICAg
WyAgIDI3LjA5NDE4NV0gIGllZWU4MDIxMV9tZ2RfYXV0aC5jb2xkKzB4MTBkLzB4MTY3IFttYWM4
MDIxMV0KICAgWyAgIDI3LjA5NDI4OV0gIGNmZzgwMjExX21sbWVfYXV0aCsweDExMy8weDFkMCBb
Y2ZnODAyMTFdCiAgIFsgICAyNy4wOTQ0MDJdICBubDgwMjExX2F1dGhlbnRpY2F0ZSsweDI5Ni8w
eDJmMCBbY2ZnODAyMTFdCgoKSXMgdGhpcyBleHBlY3RlZD8gaHR0cHM6Ly9idWd6aWxsYS5rZXJu
ZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTE1NjkgCnNvdW5kZWQgcHJvbWlzaW5nIHRvIG1lLCB0
aGF0IHRoaXMgaGFyZHdhcmUgaXMgZ29pbmcgdG8gd29yayBpbiA1LjEyIC0tIApob3dldmVyIHRo
ZSB0aHJlYWQgYWxzbyBsZWZ0IGFtYmlndWl0aXkgZm9yLCBlc3BlY2lhbGx5IHRoZQoKID4gQnV0
IHVuZm9ydHVuYXRlbHkgaXQgd2FzIGNyYXNoaW5nIGFuZCBJIGNvdWxkbid0IHRha2UgaXQgdG8g
djUuMTIKID4gKHRoZSBkZWFkbGluZSB3YXMgeWVzdGVyZGF5KS4gU28gaXQgd2lsbCBoYXZlIHRv
IHdhaXQgZm9yIHY1LjEzLAogPiBpZiB3ZSBjYW4gZml4IHRoZSBjcmFzaGVzLiBBbmQgSSdtIG9w
dGltaXN0aWMgd2UgY2FuLCBidXQKID4gSSBjYW5ub3QgcHJvbWlzZSBhbnl0aGluZy4KCiogSXMg
aXQgbGlrZWx5IHRoYXQgSSBjYW4gYWRkcmVzcyB0aGlzIGJ5IGNoYW5naW5nIGNvbmZpZ3VyYXRp
b24/CiogSWYgdGhpcyBjcmFzaCBpcyB1bmV4cGVjdGVkIGFuIG5vdCB1bmRlcnN0b29kOiBjYW4g
SSBoZWxwIGJ5IHByb3ZpZGluZyAKZnVydGhlciBpbmZvcm1hdGlvbj8KKiBXaGF0IGNhbiBJIGRv
IHRvIG1ha2UgdGhpcyBXaWZpIGhhcmR3YXJlIHdvcms/IEJ1aWxkIGEgY3VzdG9tIGtlcm5lbD8K
ClRoYW5rIHlvdSBmb3IgaGVscCwgYW5kIGFsc28gZm9yIHVuZGVyc3RhbmRpbmcgdGhhdCBteSBj
b21wZXRlbmNlIGluIAp0aGlzIGFyZWEgaXMgbGltaXRlZC4gSGFwcHkgdG8gbGVhcm4uCgpKYW4t
UGhpbGlwCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
