Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450F5C433EF
	for <ath11k@archiver.kernel.org>; Fri, 18 Feb 2022 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1FSlj3a7Hd5gADNEhh532/mVHYZj5JRO1qNesc+RVg=; b=x0Eag/6+hn2XQj
	XfrTIMdxFe8Q6H9uIRb3xzsDWesjwWYb4hGtGuSjHYDY83bX8IAXgAqfoHZwWjN8DR6ej+rtfJpV7
	LobowxiDge8lQN8q5V+V8UiIRnm0aVMjl4x5oINznHZyOIX6G7MlnYdHkYF6Ei64ePFQvhClk9hDg
	N+/pjdnc461MzjNTbcjY/7pXw0Pg7x87vY+H/SEdJSe8i3zi3BbNyIRK4pTBSP68Qps7qVCYQ7KB9
	Gy/pO2SA9j6DeUmXayLwe4yWl8zkjV+qhqVWWsxa6EatC8PtoaUnOQqZrpijJey2/IWLY7Ek5kEKq
	oJhM5759itanNVlHxQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL5c3-00FC8y-FR; Fri, 18 Feb 2022 15:56:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL5bw-00FC80-6z
 for ath11k@lists.infradead.org; Fri, 18 Feb 2022 15:56:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6AE10CE32AF
 for <ath11k@lists.infradead.org>; Fri, 18 Feb 2022 15:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4365C340E9
 for <ath11k@lists.infradead.org>; Fri, 18 Feb 2022 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645199748;
 bh=+p12Ks4PSnp/sDqUyTuQK3jFCFRJkgZY6MkXa7nJmyM=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=GkUhL+SdSf7kN4n1kw8CFYyqwIMsoj/ZNXIwzNipiWir4Dvm6pF5HC4qxciuneRV+
 KaFzLecUIDeHie1crI7ID8F+xEBDRORzKGb61jpXsLQo0tXY5gNhrBLZUWEBAokYdX
 lLUKa6Z1FSZ1gFDIlXZtnnw6ivbGbWfev1h42jOfK/NLUnsMEBdB8JPJhDm5PeoL8+
 2Q8bYAxFDOHJqxKQiNR998+SBUshdVUx/JN48UcTBAe9PZiRPYR/e+CsiUjFU+g7RM
 +Dv9b8BPe+dgoMS2+DQXYmD0qkoBO7/rlKX/xsEqkMQHesbQvAFi+WChs/BY0LFsLY
 I8lBbQ/QkbbBQ==
Received: by mail-il1-f173.google.com with SMTP id n5so4920037ilk.12
 for <ath11k@lists.infradead.org>; Fri, 18 Feb 2022 07:55:48 -0800 (PST)
X-Gm-Message-State: AOAM530EmUPbHfYHIMlX/CoZSLPIYg5/Mv5njj5tAN2qjqJ/Ssat9/Zc
 nzANudK1PdqmWbg9mOZD+di6AdupRzyXOy/9XdA=
X-Google-Smtp-Source: ABdhPJyP+OrrjwEL115ivR3yvmv3Lx9hzyvIpOYhri6Y0J0csGhwCcHuExO8hCklIT0buOXdtmV0/MjeT2+wybNgDLA=
X-Received: by 2002:a05:6e02:1544:b0:2c1:eb43:db10 with SMTP id
 j4-20020a056e02154400b002c1eb43db10mr371806ilu.251.1645199748082; Fri, 18 Feb
 2022 07:55:48 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
 <87ee4brodv.fsf@kernel.org>
In-Reply-To: <87ee4brodv.fsf@kernel.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 18 Feb 2022 10:55:37 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5DJmwPqpz8F9iDbJKcF1hDBRLdDT4URgSaiEcjet74Kw@mail.gmail.com>
Message-ID: <CA+5PVA5DJmwPqpz8F9iDbJKcF1hDBRLdDT4URgSaiEcjet74Kw@mail.gmail.com>
Subject: Re: [PULL] ath11k firmware 20211223
To: Kalle Valo <kvalo@kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_075556_627062_2A7F94ED 
X-CRM114-Status: GOOD (  22.43  )
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

T24gVGh1LCBGZWIgMTAsIDIwMjIgYXQgNTo0NSBBTSBLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IEhpIEpvc2gsCj4KPiBKb3NoIEJveWVyIDxqd2JveWVyQGtlcm5lbC5v
cmc+IHdyaXRlczoKPgo+ID4gT24gVGh1LCBEZWMgMjMsIDIwMjEgYXQgOTowMyBBTSBLYWxsZSBW
YWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+Pgo+ID4+ICBXSEVOQ0UgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTQgKy0KPiA+PiAgYXRoMTFrL0lQUTYwMTgvaHcx
LjAvTm90aWNlLnR4dCAgfCAgIDQ4ICstCj4gPgo+ID4gVGhlc2UgTm90aWNlIGZpbGVzIHNlZW0g
cHJvYmxlbWF0aWMuICBUaGV5J3JlIGNsZWFybHkgd2VsbCBpbnRlbmRlZCwKPiA+IGJ1dCB0aGV5
IGhhdmUgbGFuZ3VhZ2UgdGhhdCBhbGx1ZGVzIHRvIGFuIGFncmVlbWVudCB3aXRoIEF0aGVyb3Mg
YW5kIGEKPiA+IGNvbmZpZGVudGlhbCBuYXR1cmUgdG8gc29tZSBvZiB0aGUgZmlsZXMuICBTcGVj
aWZpY2FsbHk6Cj4gPgo+ID4gIi4uLnlvdXIgdXNlIG9mIHRoZXNlIHNvZnR3YXJlCj4gPiBjb21w
b25lbnRzIHRvZ2V0aGVyIHdpdGggdGhlIFF1YWxjb21tIEF0aGVyb3Mgc29mdHdhcmUgKFF1YWxj
b21tCj4gPiBBdGhlcm9zIHNvZnR3YXJlIGhlcmVpbmFmdGVyIHJlZmVycmVkIHRvIGFzIOKAnFNv
ZnR3YXJl4oCdKSBpcwo+ID4gc3ViamVjdCB0byB0aGUgdGVybXMgb2YgeW91ciBhZ3JlZW1lbnQg
ZnJvbSBRdWFsY29tbSBBdGhlcm9zLiIKPiA+Cj4gPiBOb2JvZHkgaGFzIGFuIG9wcG9ydHVuaXR5
IHRvIGFncmVlIHRvIGFueXRoaW5nIHdpdGggQXRoZXJvcyB3aGVuIHRoZXkKPiA+IGNvbnN1bWUg
dGhlIGZpbGVzIGZyb20gbGludXgtZmlybXdhcmUuICBUaGVyZSdzIGFsc28gbm8gZXhwbGljaXQg
Z3JhbnQKPiA+IG9mIHJlZGlzdHJpYnV0aW9uIGZvciBhbnkgb2YgdGhlc2UgZmlsZXMuCj4KPiBT
byB0aGlzIGZpbGUgd2UgYXJlIGRpc2N1c3NpbmcgaXMgdGhlIG5vdGljZS50eHQgZmlsZS4gSW4g
dGhlIFdIRU5DRQo+IGZpbGUgdGhlIGFjdHVhbCBsaWNlbnNlIGZvciBhdGgxMWsgaXM6Cj4KPiBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgx
MGsgZm9yIGRldGFpbHMKClRoZW4gaXMgdGhlIG5vdGljZS50eHQgZmlsZSBuZWVkZWQgYXQgYWxs
PyAgSWYgYSB1c2VyIG9yIGRpc3RyaWJ1dGlvbgp3ZXJlIHRvIGluc3RhbGwgdGhpcyBmaXJtd2Fy
ZSwgaXMgdGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhlIG5vdGljZS50eHQKZmlsZSBhbHNvIGJlIGlu
c3RhbGxlZD8KCj4gRG9lcyB0aGF0IGNvdmVyIHlvdXIgY29uY2VybnMgYWJvdXQgcmVkaXN0cmli
dXRpb24/CgpOb3QgcmVhbGx5LiAgSSB1bmRlcnN0YW5kIHRoZSBsb2dpYywgYnV0IGlmIHRoZSBi
aW5kaW5nIGxpY2Vuc2UgZm9yCnRoZSBmaXJtd2FyZSBpcyBMSUNFTlNFLlF1YWxjb21tQXRoZXJv
c19hdGgxMGsgYnV0IHdlIHN0aWxsIG5lZWQKbm90aWNlLnR4dCBmb3Igc29tZSByZWFzb24sIHRo
ZXkgY29uZmxpY3QuICBJdCdzIGFtYmlndW91cyBhdCBiZXN0LgoKam9zaAoKPiBJJ20gc3RpbGwg
d29ya2luZyBvbiB5b3VyIG90aGVyIGNvbW1lbnQgYWJvdXQgbm90aWNlLnR4dCwgd2lsbCBnZXQg
YmFjawo+IG9uIHRoYXQgbGF0ZXIuCj4KPiAtLQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0Lwo+Cj4gaHR0cHM6Ly93aXJlbGVzcy53aWtp
Lmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVz
CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
