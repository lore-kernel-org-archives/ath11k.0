Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9973E7D27F
	for <ath11k@archiver.kernel.org>; Tue, 26 Sep 2023 11:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mzsa92fVEpchkY5MA9TQTr+pWB8p2C4H2KzIlz+NEhI=; b=WBAXMSJka+/yYv
	q1dRYGi0ZXGAiuHl/J9bDYIju5dCwFIuic5V4GD31/i02HW6QYw8W4TWJclJm1IV6E7Xtohi8cKrG
	HEVYvQFJFWl8pF9hJzc1pa+fhz94iGDYCujUifhWeVBc6A3moV8xra1DdqXXyBvQ0l1yCWImu3l4d
	9lGAsSHcrDGuwNryW0zfj2ijK/LOAJKrFDvf2vzUkdBFp3OQ/J2+OjY+HfD9b9tL1bb02z2WAf5C6
	OTKB1wjXOvOGfiV1buxDIvBuzrgv/2FKdCU2HDuZbXjbhBV8RocDrvXjObOJOQd0aAk9zZMoJwShd
	B10aeXko3MWTQ08fLPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5tB-00GDuF-2o;
	Tue, 26 Sep 2023 11:06:01 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5t9-00GDtb-00
	for ath11k@lists.infradead.org;
	Tue, 26 Sep 2023 11:06:00 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-532bf1943ebso10213418a12.0
        for <ath11k@lists.infradead.org>; Tue, 26 Sep 2023 04:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squaremind-io.20230601.gappssmtp.com; s=20230601; t=1695726355; x=1696331155; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jm3O9jEt9oxWkX/HRGQIqsRK5cTXxlvE0ETsEdn/ZlI=;
        b=cYAhRxLo+LqUY09J/XYPhGaQ3lfvwpJXp0j1BzmpAGiTHPj2RAGIKPNpcyGdYo8Kzq
         j5nfYRzmUrx0+1mHAdBQNZEEhyD+WRoZ8wrODO735ivICwMn8rteehOjE0FqeU0wBY05
         jM9yjO1qFjL3OOsxEZT11p8SQ5IHRtpca4tmsPsqS1NJKMc0/kfXdmbHAZj2E+e3bPj0
         wJnQ+upnE7+/4y8pvRCUsKQM7cRsMz3vOemdqzjmnPVg3GbmuptI6+hsdduTSaD5YThX
         6/wzCBfJJWyxrOv4TFqtMKctZcfuezXh5KqU6wH8tNp5eZNSpPY8+/B2smxDZ+xVu+W8
         TQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695726355; x=1696331155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jm3O9jEt9oxWkX/HRGQIqsRK5cTXxlvE0ETsEdn/ZlI=;
        b=els0wHOnl4cZ4+4QM/Mba2A2rVWdbB+mizHZ/jRtnZbcO/R/HiMwqthXHA+GiiCJFb
         DD+oc1Jyy/LZV2llklGQw8hSv13uvvIBDHTH+JHo80buf93xCyMeFd20KnzT2ASdV3T5
         jeuQSMHm6ue3uttIq+XS1NSHErEuf84z7lWU2o934KWxbMfUnrqJuvngB0HVFoCql9Wh
         ZTfSAnOahvzcVElq87FAd0g7cdCaXbfIbzqiToA/3zk0y4QnuxImw/uy2qDVyto5NsMS
         rgBIS0uF5QleP+6SFeHQjK2N2ztcj2edNndbfcH3fteH76bCuJwKvCTPbF35ymQCVuL6
         l/Dw==
X-Gm-Message-State: AOJu0Yyp/Tn/bJJUbFNJvgvNm0AvEm/Yjv5qeOkTM3fOdKRoDEsn5ox+
	Hg0v/sVKKBUI+BuecacITQ11qU1qjlym/SFh9034oz6boot32UmlGLZlnA==
X-Google-Smtp-Source: AGHT+IGBDsIZxryCxMSIGgtS60tjnItygUEa2g8IT2BSrST8euL86wSxQGNBocvcmtivRCqph6Xbit++u6D6ujBjshk=
X-Received: by 2002:aa7:d705:0:b0:523:33d7:e324 with SMTP id
 t5-20020aa7d705000000b0052333d7e324mr8443923edq.38.1695726355371; Tue, 26 Sep
 2023 04:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
 <87sf9v7xir.fsf@kernel.org> <CAPr+0HbwpA0KrV71ah8bQ_Gnn9Ch2PMZnHE3uqRUrNU8=DoMFA@mail.gmail.com>
 <87jzv696zv.fsf@kernel.org> <CAPr+0HbBEXXqTJ7Hv3cfKBB=rtZ+tq4Xn_YVLxsNz=kbn3b=Ww@mail.gmail.com>
In-Reply-To: <CAPr+0HbBEXXqTJ7Hv3cfKBB=rtZ+tq4Xn_YVLxsNz=kbn3b=Ww@mail.gmail.com>
From: Tanguy Serrat <tanguy@squaremind.io>
Date: Tue, 26 Sep 2023 13:05:44 +0200
Message-ID: <CAPr+0HYQqU_xciRk5+y1PN_UqZi_EY0FacH43Bxfw-daCMgY4w@mail.gmail.com>
Subject: Re: ath11k: QCN9074: low HE-MCS index
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_040559_042155_1B029AE3 
X-CRM114-Status: GOOD (  20.09  )
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

RGVhciBLYWxsZSwKCkkgaG9wZSB5b3UgYW5kIHlvdXIgdGVhbSBoYWQgZ3JlYXQgdmFjYXRpb25z
LgoKV291bGQgaXQgYmUgcG9zc2libGUgdG8gaGF2ZSBzb21lb25lIGhlbHBpbmcgdXMgb3V0IG9u
IG91ciAjMjE3NjUyIGJ1Zwp3aXRoIFFDTjkwNzQgPwoKVGhpcyBpcyBhIHN0cm9uZyBib3R0bGVu
ZWNrIG9uIG91ciBzaWRlIHRoYXQgd2UgcmVhbGx5IG5lZWQgdG8gc29sdmUuCgpUaGFuayB5b3UK
CgpMZSBtZXIuIDEyIGp1aWwuIDIwMjMgw6AgMTA6MzcsIFRhbmd1eSBTZXJyYXQgPHRhbmd1eUBz
cXVhcmVtaW5kLmlvPiBhIMOpY3JpdCA6Cj4KPiA+IFRoYW5rcyBmb3IgZmlsaW5nIHRoZSByZXBv
cnQsIHdlIHdpbGwgbG9vayBhdCBidWcgIzIxNzY1MiBhbmQgZ2V0IGJhY2sKPiA+IHRvIHlvdS4g
QnV0IGRvIG5vdGUgdGhhdCB0aGlzIHdpbGwgbW9zdCBsaWtlbHkgdGFrZSBzb21lIHRpbWUsIG91
cgo+ID4gYmFja2xvZyBpcyBsb25nIGFuZCBwZW9wbGUgYXJlIGFsc28gdGFraW5nIHZhY2F0aW9u
cy4gSSBqdXN0IGNhbWUgYmFjawo+ID4geWVzdGVyZGF5IGFuZCBJJ20gaG9waW5nIHRvIHRha2Ug
bW9yZSB2YWNhdGlvbiBsYXRlciB0aGlzIG1vbnRoLgo+Cj4gRHVseSBub3RlZCwgdGhhbmsgeW91
LiBJIGhvcGUgeW91IGFuZCB5b3VyIHRlYW0gd2lsbCBoYXZlIGEgZ29vZCBicmVhay4KPgo+IFdl
J3ZlIHNwZW50IDE1MCsgaG91cnMgd29ya2luZyBvbiBiYWNrcG9ydGluZyBhbmQgZ2V0dGluZyBv
dXIgUUNOOTA3NCB0byB3b3JrLgo+IFdlIHdvdWxkIGJlIGV4dHJlbWVseSBncmF0ZWZ1bCBpZiB5
b3UgZ3V5cyBjYW4gaGVscCB1cyBwdXQgdGhpcwo+IG1pbGVzdG9uZSBiZWhpbmQsIHNvIHRoYXQg
d2UgY2FuIG1vdmUgZm9yd2FyZCBpbiB0aGUgZGV2ZWxvcG1lbnQgb2YKPiBvdXIgbWVkaWNhbCBw
cm9kdWN0IGFuZCBiZSBvbiB0aW1lIGZvciBvdXIgUmFkaW8gY2VydGlmaWNhdGlvbi4KPgo+IExl
IG1hci4gMTEganVpbC4gMjAyMyDDoCAxMDozOSwgS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9y
Zz4gYSDDqWNyaXQgOgo+ID4KPiA+IFRhbmd1eSBTZXJyYXQgPHRhbmd1eUBzcXVhcmVtaW5kLmlv
PiB3cml0ZXM6Cj4gPgo+ID4gPiBEZWFyIEthbGxlLAo+ID4gPgo+ID4gPiBUaGFuayB5b3UgZm9y
IHlvdXIgcmVwbHkuCj4gPiA+Cj4gPiA+IEkgaGF2ZSBvcGVuZWQgdHdvIHNlcGFyYXRlIGlzc3Vl
czoKPiA+ID4gMSkgaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0y
MTc1MzYgLSByZWxhdGVkIHRvIGEKPiA+ID4gcHJldmlvdXMgaXNzdWUgSSBlbmNvdW50ZXJlZC4K
PiA+ID4KPiA+ID4gMikgaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9p
ZD0yMTc2NTIgLSByZWxhdGVkIHRvIHRoaXMgZmVlZC4KPiA+ID4KPiA+ID4gSSBoYXZlIHRlc3Rl
ZCAzbSBhcGFydCwgYXMgZGVzY3JpYmVkIGluIDIxNzY1MiwgcmVzdWx0cyBhcmUganVzdAo+ID4g
PiBzbGlnaHRseSBiZXR0ZXIgaW4gdGVybXMgb2YgcmVwb3J0ZWQgTUNTLiBJIHN0aWxsIHNlZW0g
dG8gYmUgbWlzc2luZwo+ID4gPiBhbGwgY2FwYWJpbGl0aWVzIG92ZXIgNy4gSSBoYXZlIGF0dGFj
aGVkIHRoZSBmdWxsIGRtZXNnIGxvZyBhbmQKPiA+ID4gLmNvbmZpZyBmaWxlIHRvIHRoZSBidWcg
cmVwb3J0Cj4gPgo+ID4gVGhhbmtzIGZvciBmaWxpbmcgdGhlIHJlcG9ydCwgd2Ugd2lsbCBsb29r
IGF0IGJ1ZyAjMjE3NjUyIGFuZCBnZXQgYmFjawo+ID4gdG8geW91LiBCdXQgZG8gbm90ZSB0aGF0
IHRoaXMgd2lsbCBtb3N0IGxpa2VseSB0YWtlIHNvbWUgdGltZSwgb3VyCj4gPiBiYWNrbG9nIGlz
IGxvbmcgYW5kIHBlb3BsZSBhcmUgYWxzbyB0YWtpbmcgdmFjYXRpb25zLiBJIGp1c3QgY2FtZSBi
YWNrCj4gPiB5ZXN0ZXJkYXkgYW5kIEknbSBob3BpbmcgdG8gdGFrZSBtb3JlIHZhY2F0aW9uIGxh
dGVyIHRoaXMgbW9udGguCj4gPgo+ID4gLS0KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0Lwo+ID4KPiA+IGh0dHBzOi8vd2lyZWxlc3Mu
d2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0
Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
