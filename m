Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AEFC433F5
	for <ath11k@archiver.kernel.org>; Tue, 31 May 2022 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:Mime-Version:Cc:Content-ID:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ydPjbVn5EQDNh9FDM0kTA3Yy83gnl8TK0uKtvt07KU=; b=Dh1wURYNwBMSF0
	267SbOMUiH32t6jVBm77Zr/YNl6T+NJoTaAvbi07ofFshkUxsOwMLebB3Nv7vq5eSQ9C3SLiYOw+q
	KfUH+PjzbtLvoBq6f+nvCoZjVx/ea01mdScw7RFalCofCo6W9FdQCWv3anAWXwXMsTuQqkAa8K0fK
	LZZqXJcRhOnP3/uSTiMg3Fmc4quZSCrmxAKAOrflP+vx3qtfQPmds13662+XJF4GzckfPp1kw64BB
	rL3wGXO6CBKjewbl6ByF2YF68MIBlRHG1fmccvUaM3EA+rLYX3VqkECeIx9ZiIHL3n7GLsAJzCVMT
	f8qWJWhpuIIKWo+1X7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvxX5-009t80-Hx; Tue, 31 May 2022 08:47:19 +0000
Received: from [45.66.248.76] (helo=host.hosttoname.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvxX2-009t5s-Pj
	for ath11k@lists.infradead.org; Tue, 31 May 2022 08:47:17 +0000
Received: from [193.70.26.62] (ip62.ip-193-70-26.eu [193.70.26.62])
	by host.hosttoname.com (Postfix) with ESMTPA id 7050523CE2
	for <ath11k@lists.infradead.org>; Tue, 31 May 2022 08:31:27 +0000 (UTC)
Mime-Version: 1.0
Content-Description: Mail message body
Subject: Your kind attention
To: ath11k@lists.infradead.org
From: mathej200@proton.me
Date: Tue, 31 May 2022 01:31:22 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_014716_914545_18D0BC10 
X-CRM114-Status: SPAM  (  -5.79  )
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
Reply-To: mathew@mjsconsortium.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Message-ID: <E1nvxX5-009t80-Hx@bombadil.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SGVsbG8gdGhlcmUsCgpNeSBuYW1lcyBhcmUgTWF0aGV3IEpvaG5zb24sIEkgYW0gcmVwcmVzZW50
aW5nIHRoZSBpbnRlcmVzdCBvZiBhIGNlcnRhaW4gcG9saXRpY2FsbHkgZXhwb3NlZCBwZXJzb24s
IHdlIGFyZSBsb29raW5nIGZvciBwYXJ0bmVycyBvdmVyc2VhcyB0aGF0IGNhbiBtYW5hZ2UgaGln
aC12YWx1ZSBmdW5kcyBmb3IgYSBwZXJpb2Qgb2YgNS0xMCB5ZWFycywgdGhlIGZ1bmRzIGhhdmUg
YmVlbiBhY2NydWVkIGJ5IHRoZSBpbmZsdWVuY2Ugb2YgdGhlIHBvd2VyIG9mIG15IGJlbmVmYWN0
b3LigJlzIG9mZmljZS4KClBsZWFzZSBkbyBjb250YWN0IG1lIGlmIHlvdSBhcmUgaW50ZXJlc3Rl
ZCBhbmQgSSB3aWxsIGV4cGxhaW4gdGhlIGJ1c2luZXNzIHRvIHlvdSBpbiBkZXRhaWwgZm9yIHlv
dSB0byBiZXR0ZXIgdW5kZXJzdGFuZCB0aGUgdHJhbnNhY3Rpb24sIEkgY2FuIGFzc3VyZSB5b3Ug
dGhhdCB0aGlzIHdpbGwgYmUgb2YgbXV0dWFsIGJlbmVmaXQgdG8gYWxsLgoKWW91IGNhbiByZXNw
b25kIHRvIG1lIGFuZCBpIHdpbGwgc2VuZCB5b3UgYSBkZXRhaWxlZCBleHBsYW5hdGlvbgoKWW91
cnMuCgpNYXRoZXcgSm9obnNvbi4KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
