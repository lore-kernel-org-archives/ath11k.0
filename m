Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1FCC04AAB
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 12:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SGYAuCSnglEss2yuPNmTGb7nIpr+nmf3vu8qPH5Sd/s=; b=rdyaK2M+36Rggm
	13HNdABDRZRQSZ3xaA9zOG9KPj+P6vcqqnIo47QvKiQYu8eobNJXi1j5kD3YlC/MKIKUNQfT01Td5
	cTHcxxTB1W3yjF4xq/2GX+rC0UbqmOkCleoodbwKLzM6KmuaU9zEuct5rqcF2QXluC5K5oep6Re08
	TYCneL+Ou6WEv0NIg3gAnDse6/lFHoc4gMxzoJEWhayvL03LOc5O4gd2gXGAOBP15JwR5Tcz8ZTdt
	TlRQKJvbjCJ3hA+kozbJ1nsG/RUQzQwZKdcC2+vubcmE3q52lxqYSp99sxH8216+DNjZv5sNQ+Wwp
	WDsCPpgEAGvuVxEjREkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjerZ-0091Bv-1v;
	Fri, 22 Sep 2023 12:02:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjerX-0091BN-19
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 12:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695384141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4cy021/toY323+D3zOQB5/xvXNwICCVgZEWVintFSi0=;
	b=azAjNkoHG+Ha37RM/Fz6GYJHuGp5pQQxpIkMfbYxbfDIeCCBm8vG5ap2NQmAItDLcx8J7r
	GljERR9DQvl36cx1lCGDnXT2HbsLZDPWaMdOJL7QbHnUaDEhBOhNtlKRms0/moVuLjQwa9
	2AVmfSpAIBTbPGYqyyxDlBs82pJvDIg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-STLtHhTrNj653BGVMwqeow-1; Fri, 22 Sep 2023 08:00:43 -0400
X-MC-Unique: STLtHhTrNj653BGVMwqeow-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E9763816C82;
	Fri, 22 Sep 2023 12:00:43 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72615492C37;
	Fri, 22 Sep 2023 12:00:41 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jtornosm@redhat.com
Subject: [bug] mhi: ath11k: resume after hibernation is not working
Date: Fri, 22 Sep 2023 14:00:16 +0200
Message-ID: <20230922120040.15460-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_050223_564471_5E89EA4A 
X-CRM114-Status: UNSURE (   8.90  )
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

SGVsbG8sCgpXZSBoYXZlIHNldmVyYWwgbWFjaGluZXMgd2l0aCBRQ05GQTc2NSB3aXJlbGVzcyBj
YXJkIChXQ042ODU2KSBhbmQgd2l0aAp0aGUgc2FtZSBiZWhhdmlvcjogYWx0aG91Z2ggaGliZXJu
YXRpb24gc2VlbXMgdG8gd29yaywgcG9zdCByZXN1bWUgaXMgbm90CndvcmtpbmcgZHVlIHRvIHRo
ZSB3aXJlbGVzcyBjYXJkIChpZiB0aGUgd2lyZWxlc3MgY2FyZCBpcyBkaXNhYmxlZCBvciBhdGgx
MWsKZHJpdmVyIGlzIGJsYWNrbGlzdGVkLCBldmVyeXRoaW5nIGlzIHdvcmtpbmcpLgoKQWZ0ZXIg
aGliZXJuYXRpb24sIHdoZW4gd2UgcmVzdW1lIChwb3dlciBvbiksIHdlIGdldCB0aGUgZm9sbG93
aW5nIHJlbGF0ZWQKbG9nczoKLi4uClsgICAgOS42MzE0MjZdIGF0aDExa19wY2kgMDAwMDowMzow
MC4wOiB3Y242ODU1IGh3Mi4xClsgICAxMC42NzM4MzRdIGF0aDExa19wY2kgMDAwMDowMzowMC4w
OiBjaGlwX2lkIDB4MTIgY2hpcF9mYW1pbHkgMHhiIGJvYXJkX2lkIDB4ZmYgc29jX2lkIDB4NDAw
YzEyMTEKWyAgIDEwLjY4MzEzN10gYXRoMTFrX3BjaSAwMDAwOjAzOjAwLjA6IGZ3X3ZlcnNpb24g
MHgxMTBiMTk2ZSBmd19idWlsZF90aW1lc3RhbXAgMjAyMi0xMi0yMiAxMjo1NCBmd19idWlsZF9p
ZCBXTEFOLkhTUC4xLjEtMDMxMjUtUUNBSFNQU1dQTF9WMV9WMl9TSUxJQ09OWl9MSVRFLTMuNjUx
MC4yMwouLi4KWyAgMTIzLjMyMzY4OV0gbWhpIG1oaTA6IERpZCBub3QgZW50ZXIgTTAgc3RhdGUs
IE1ISSBzdGF0ZTogTTMsIFBNIHN0YXRlOiBNMy0+TTAKWyAgMTIzLjMyMzY5M10gYXRoMTFrX3Bj
aSAwMDAwOjAzOjAwLjA6IGZhaWxlZCB0byByZXN1bWUgbWhpOiAtNQpbICAxMjMuMzIzNjk1XSBh
dGgxMWtfcGNpIDAwMDA6MDM6MDAuMDogZmFpbGVkIHRvIHJlc3VtZSBoaWYgZHVyaW5nIHJlc3Vt
ZTogLTUKWyAgMTIzLjMyMzY5Nl0gYXRoMTFrX3BjaSAwMDAwOjAzOjAwLjA6IGZhaWxlZCB0byBy
ZXN1bWUgY29yZTogLTUKWyAgMTIzLjMyMzY5Nl0gYXRoMTFrX3BjaSAwMDAwOjAzOjAwLjA6IFBN
OiBkcG1fcnVuX2NhbGxiYWNrKCk6IHBjaV9wbV9yZXN0b3JlKzB4MC8weGUwIHJldHVybnMgLTUK
WyAgMTIzLjMyMzcwMl0gYXRoMTFrX3BjaSAwMDAwOjAzOjAwLjA6IFBNOiBmYWlsZWQgdG8gcmVz
dG9yZSBhc3luYzogZXJyb3IgLTUKWyAgMTI2LjMzMTcyNl0gYXRoMTFrX3BjaSAwMDAwOjAzOjAw
LjA6IHdtaSBjb21tYW5kIDE2Mzg3IHRpbWVvdXQKWyAgMTI2LjMzMTczMF0gYXRoMTFrX3BjaSAw
MDAwOjAzOjAwLjA6IGZhaWxlZCB0byBzZW5kIFdNSV9QREVWX1NFVF9QQVJBTSBjbWQKWyAgMTI2
LjMzMTczMl0gYXRoMTFrX3BjaSAwMDAwOjAzOjAwLjA6IGZhaWxlZCB0byBlbmFibGUgZHluYW1p
YyBidzogLTExClsgIDEyNi4zMzE3MzRdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0t
LS0tLQpbICAxMjYuMzMxNzM0XSBIYXJkd2FyZSBiZWNhbWUgdW5hdmFpbGFibGUgdXBvbiByZXN1
bWUuIFRoaXMgY291bGQgYmUgYSBzb2Z0d2FyZSBpc3N1ZSBwcmlvciB0byBzdXNwZW5kIG9yIGEg
aGFyZHdhcmUgaXNzdWUuClsgIDEyNi4zMzE3NDldIFdBUk5JTkc6IENQVTogNCBQSUQ6IDE5Njcg
YXQgbmV0L21hYzgwMjExL3V0aWwuYzoyNTY4IGllZWU4MDIxMV9yZWNvbmZpZysweGE5LzB4MTY2
MCBbbWFjODAyMTFdCi4uLgpMaW51eCBrZXJuZWwgdmVyc2lvbjogNi42LjBfcmMyCgpDb3VsZCB5
b3UgaGVscCBtZSB0byBmaXggdGhpcz8KV2h5IGlzIE0zLT5NMCB0cmFuc2l0aW9uIG5vdCB3b3Jr
aW5nPyBDb3VsZCBpdCBiZSBhbiBpc3N1ZSB3aXRoIHRoZSBmaXJtd2FyZT8KClRoYW5rcwoKQmVz
dCByZWdhcmRzCkpvc8OpIElnbmFjaW8KCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDExawo=
