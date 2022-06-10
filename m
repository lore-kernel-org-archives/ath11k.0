Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CA2CCA47B
	for <ath11k@archiver.kernel.org>; Fri, 10 Jun 2022 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AuByv3rbp+L1u7c34IocjumoQaD4J+LytWe154rMs5s=; b=cNWAU1XFIBdIrU
	7yC+OWR9U6re6sAaoOkCug0kYnU7C9fjgZMZpNt2zPS1K9FbCPHZ4PKA7afZjRqUx5sCEsj9qbLbD
	DWH+R2BC7525FLkyE1eNuk/NxO0l3jJDSDvFYv8d975A5gU/cnMe1QnM4ijQgbxWybEdf0F01HnbE
	cs7/Lqoc53fvZ2YIHxdyhJ7fbPoSVQa0ZIBA+wLkgo1Anz5pgvbBa1zRdZCH4u3iunrzAD8oJKICR
	SoPMXldfzWkuCijpHko9uAxlHnRXTXEx1sot+XEHOLXGBRlcFcxRdum+UM1MaVKx/0u23wT1siOeU
	aPcxlR9G/iqFaXjp3wXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzeoj-008OIB-Mv; Fri, 10 Jun 2022 13:36:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzeog-008OHI-Lb
	for ath11k@lists.infradead.org; Fri, 10 Jun 2022 13:36:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5606F61B22
	for <ath11k@lists.infradead.org>; Fri, 10 Jun 2022 13:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277AFC34114;
	Fri, 10 Jun 2022 13:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654868204;
	bh=MvVzgcpreC7kAbvFcHN7/ImYpOY0N6AnfZXoOrGMCX0=;
	h=From:To:Cc:Subject:Date:From;
	b=esqsUxY4xzE2Qw42TqlJUPctigFP+s2OJdhSyB/aU+FooeGB9bglV3WT9FCmfaX1v
	 IRbdMsb1b5E+bLCSYqeBC8aBiZWZxPjXlZFp/fAzj74YuWMuBDxOhXFqxUOGQs4q9y
	 8nhN610pVxxGakdLSMFLb9ZoRtlbEESvuJC112X2lDdhUj0Kx6SUMUPAJb7xcUiTZG
	 gmlJLskaIBBRaCT9eNqjdTabgXfcNEzyfgZ7vzZALhye9bq6B1EA5a9H4gTxojQtgN
	 WpxHnvIFNpZpf+c+aqlmDGqBNGzsnu5yYfEp8xPjGO9A+Vt4Fv/vHZpGpbXZyx8XqJ
	 gAB2IaRB/iYmg==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH wireless v2 1/2] dt-bindings: net: wireless: ath9k: Change Toke as maintainer
Date: Fri, 10 Jun 2022 16:36:39 +0300
Message-Id: <20220610133640.10810-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_063646_788845_A097EC67 
X-CRM114-Status: GOOD (  10.13  )
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

RnJvbTogS2FsbGUgVmFsbyA8cXVpY19rdmFsb0BxdWljaW5jLmNvbT4KClRva2Ugbm93IG1haW50
YWlucyBhdGg5ayBzbyB1cGRhdGUgRFQgYmluZGluZ3MgYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6
IEthbGxlIFZhbG8gPHF1aWNfa3ZhbG9AcXVpY2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC93aXJlbGVzcy9xY2EsYXRoOWsueWFtbCB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvd2lyZWxlc3MvcWNhLGF0aDlr
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3dpcmVsZXNzL3Fj
YSxhdGg5ay55YW1sCmluZGV4IDhjZDBhZGJmNzAyMS4uNzAyOWNiMWYzOGZmIDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3dpcmVsZXNzL3FjYSxhdGg5
ay55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvd2lyZWxl
c3MvcWNhLGF0aDlrLnlhbWwKQEAgLTcsNyArNyw3IEBAICRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwogdGl0bGU6IFF1YWxjb21tIEF0aGVyb3Mg
YXRoOWsgd2lyZWxlc3MgZGV2aWNlcyBHZW5lcmljIEJpbmRpbmcKIAogbWFpbnRhaW5lcnM6Ci0g
IC0gS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+CisgIC0gVG9rZSBIw7hpbGFuZC1K
w7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+CiAKIGRlc2NyaXB0aW9uOiB8CiAgIFRoaXMgbm9kZSBw
cm92aWRlcyBwcm9wZXJ0aWVzIGZvciBjb25maWd1cmluZyB0aGUgYXRoOWsgd2lyZWxlc3MgZGV2
aWNlLgoKYmFzZS1jb21taXQ6IDkwZjRiNTQ5OWNkZDk0YmUzYzFlODU2Mzc1ZWNkN2Q1ZjljNGNl
Y2MKLS0gCjIuMzAuMgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTFrCg==
