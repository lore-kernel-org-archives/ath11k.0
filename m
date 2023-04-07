Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E7DC6FD1D
	for <ath11k@archiver.kernel.org>; Fri,  7 Apr 2023 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztjeBK0pqSlurWBvyLjSa+eIWSqKGzmZRfu019LomEw=; b=PYQixq+gr79G6d
	kEhvUe/cEPhg6cBKAEH245xr1smuSPBB9MOIcM6p/pMVI30B2fzzAJPcYWUCBPBh09Q0sbUoK6np2
	eH81dtv4RjJ4TWDcFBTD27eOPTdkybRuRVCcXCkJsxo8RY77O09TbxeYTRNaSpapyfN/V5FTWheEQ
	NiZxGPsV8JJNXT7lsb9pFnHCk75VFb0ZyZqEwzvaJfyY3YsyJ0mu7vaCBXGwpjgTtfjnETQTGsfy5
	Bjn59B7h6QVV9krrDWdxKafeMdEWzd7eRXWvD29OQuHLq07Dx7r5tqQ0QFj66fwp2PWbn3Xhkamyh
	TMQl1ntQIHIRbfEWBrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhjo-009XwR-1q;
	Fri, 07 Apr 2023 08:46:28 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhjl-009XvM-1h
	for ath11k@lists.infradead.org;
	Fri, 07 Apr 2023 08:46:26 +0000
Received: by mail-pj1-x1036.google.com with SMTP id q15-20020a17090a2dcf00b0023efab0e3bfso881395pjm.3
        for <ath11k@lists.infradead.org>; Fri, 07 Apr 2023 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1680857184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPTOv+DM05W9cwzt4Rn6d40o6lDSVUKnb5CZXf5ma68=;
        b=t0xrc+Cp6MW2p4iU5zgQemwCYxUNSfY4cv7WDB6gf07DuFGCYh93zENZwbrnLo9dsC
         r+eS7uQ1aBMsyM0yhyeybMgGqjsn/Ael3qahzCXv7eBC5qVEkKL53LDvPsiVlT7IUyB+
         GFVl8A/z5mX1ArxYqS22J1WauUpJeskPBmenfIbr4TVWHKpC4LRTyfWhZ44H4l+Ahq/6
         dXl3F8J7Sgw9wchV/dEf7Dn31rV9fttzosi9R6WRlZngAjQMfvlOp9bYWavXN5OhQZQj
         R1fZ7U6AWUHactCojlLjvXndsnZq0SWairDbmkRAOTWlaIB3VZUAp2o87CaR0TJZa/LN
         mleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680857184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPTOv+DM05W9cwzt4Rn6d40o6lDSVUKnb5CZXf5ma68=;
        b=jOzWVXRF9Xm8I40psaejQQ1qTox9lRi1WfCM/DzPU4DorWDkJQRT0bYdKndda6fXM+
         lPIUdvQe7rRU5uEed4TW90GO6RftLK9DLxZ766DftF2VC1xzTD+F+srU+JJcObwZ40YK
         i7/JrD4/dVZikVHI8dEBN9ZatDaI2CJFXIr9aSA1N9wwauFfsms5P24vIlV3Re7jt2xc
         Xzt9x+24R7iv5ppRtruOC7zWl2VgCM9Aa6TC6Smzw9/1Fu8WYQoGhSpL6pLdfUBJ5oHc
         x8ET7dF1zGa/mxPYAMfradVxeWktWciDhBmUbZUYLUweXnzTcUuKgLBsFRarZUEfI0te
         RblQ==
X-Gm-Message-State: AAQBX9c7t8Wx9e5EE5ztzSxiQpr9WYngFAubmPbBDMtGb/vtH1xyF9x/
	uJOsVnu2WbrtA01pV4ApzXCoq4YE3U/kohCytk3hPQ==
X-Google-Smtp-Source: AKy350YK3svQRM/ARq1iX1PPvnHdA4GcRtLaWISk+R+u99hfTCEmNf92dd6JNrVwxifscGK4ozIUeOezNPqlnwg4ciY=
X-Received: by 2002:a17:902:e5c4:b0:1a2:87a2:c932 with SMTP id
 u4-20020a170902e5c400b001a287a2c932mr680426plf.10.1680857183942; Fri, 07 Apr
 2023 01:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230320133840.30162-1-quic_nmaran@quicinc.com>
In-Reply-To: <20230320133840.30162-1-quic_nmaran@quicinc.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 7 Apr 2023 10:46:13 +0200
Message-ID: <CA+HBbNFXkOqFr9cKmB+Me3q4pbR31u5d21EuCCUnos7hGQi9RQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: Fix invalid management rx frame length issue
To: Nagarajan Maran <quic_nmaran@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_014625_571199_DE8161C3 
X-CRM114-Status: UNSURE (   9.12  )
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

T24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgMjozOeKAr1BNIE5hZ2FyYWphbiBNYXJhbiA8cXVpY19u
bWFyYW5AcXVpY2luYy5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQmhhZ2F2YXRoaSBQZXJ1bWFsIFMg
PHF1aWNfYnBlcnVtYWxAcXVpY2luYy5jb20+Cj4KPiBUaGUgV01JIG1hbmFnZW1lbnQgcnggZXZl
bnQgaGFzIG11bHRpcGxlIGFycmF5cyBvZiBUTFZzLCBob3dldmVyIHRoZSBjb21tb24KPiBXTUkg
VExWIHBhcnNlciB3b24ndCBoYW5kbGUgbXVsdGlwbGUgVExWIHRhZ3Mgb2Ygc2FtZSB0eXBlLgo+
IFNvIHRoZSBtdWx0aXBsZSBhcnJheSB0YWdzIG9mIFdNSSBtYW5hZ2VtZW50IHJ4IFRMViBpcyBw
YXJzZWQgaW5jb3JyZWN0bHkKPiBhbmQgdGhlIGxlbmd0aCBjYWxjdWxhdGVkIGJlY29tZXMgd3Jv
bmcgd2hlbiB0aGUgdGFyZ2V0IHNlbmRzIG11bHRpcGxlCj4gYXJyYXkgdGFncy4KPgo+IEFkZCBz
ZXBhcmF0ZSBUTFYgcGFyc2VyIHRvIGhhbmRsZSBtdWx0aXBsZSBhcnJheXMgZm9yIFdNSSBtYW5h
Z2VtZW50IHJ4Cj4gVExWLiBUaGlzIGZpeGVzIGludmFsaWQgbGVuZ3RoIGlzc3VlIHdoZW4gdGhl
IHRhcmdldCBzZW5kcyBtdWx0aXBsZSBhcnJheQo+IHRhZ3MuCj4KPiBUZXN0ZWQtb246IFFDTjkw
NzQgaHcxLjAgUENJIFdMQU4uSEsuMi43LjAuMS0wMTc0NC1RQ0FIS1NXUExfU0lMSUNPTlotMQo+
Cj4gU2lnbmVkLW9mZi1ieTogQmhhZ2F2YXRoaSBQZXJ1bWFsIFMgPHF1aWNfYnBlcnVtYWxAcXVp
Y2luYy5jb20+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBOYWdhcmFqYW4gTWFyYW4gPHF1aWNfbm1hcmFu
QHF1aWNpbmMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5hZ2FyYWphbiBNYXJhbiA8cXVpY19ubWFy
YW5AcXVpY2luYy5jb20+Cj4KPiAtLS0KCldlIGhpdCB0aGUgZXhhY3QgZXJyb3IgdGhhdCB0aGlz
IHBhdGNoIGZpeGVzIHdoaWxlIHVwZGF0aW5nIHRvIEZXCjIuOS4wLjEgb24gSVBRODA3NCBhbmQK
aXQgZml4ZWQgaXQgc286ClRlc3RlZC1ieTogUm9iZXJ0IE1hcmtvIDxyb2JlcnQubWFya29Ac2Fy
dHVyYS5ocj4KClJlZ2FyZHMsClJvYmVydAotLSAKUm9iZXJ0IE1hcmtvClN0YWZmIEVtYmVkZGVk
IExpbnV4IEVuZ2luZWVyClNhcnR1cmEgTHRkLgpMZW5kYXZza2EgdWxpY2EgMTZhCjEwMDAwIFph
Z3JlYiwgQ3JvYXRpYQpFbWFpbDogcm9iZXJ0Lm1hcmtvQHNhcnR1cmEuaHIKV2ViOiB3d3cuc2Fy
dHVyYS5ocgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
