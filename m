Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617C1606A320
	for <ath11k@archiver.kernel.org>; Fri, 23 Oct 2026 13:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fxZGP3rZ;
	dkim=pass (2048-bit key, unprotected) header.d=andrei-z.com header.i=@andrei-z.com header.a=rsa-sha256 header.s=sig1 header.b=WELMJaNg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bO/ySbw6Wy2tlDziwBPGxxBRPseyc5qUYsYdDeHqHWI=; b=fxZGP3rZZtJIcUrui1B4CPli2a
	GJ7mb8isO3tcjhU3qH+t4jROg1fCRXY2X2GHCTg/S5dtF+Tr/pA0IJhT//0H6VEroqFo98eSyey9e
	UgFCVrkNfFif2ZITeJcy86Zstdd9E/reQWjIMQRJ2yT43YNVDugTlqlSMIKAsd5MjncEr/Bw3BMbI
	rFquDi5u/fdrcuyvRcDg8cb0Cs1UFGLR23Q3D2KCtw66u0FQKeCbpIUM1wrNstZzrrpakgFeCKU7T
	aKtaaxpqbp2hgnb0IkHMmtfvq6ORrsmHNdOaK+qOZZ45OWTJOB+vzJhOTFZQETKLfQhqVc0q0Llu1
	XoIDaY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFTP-0000000GOYj-047Y;
	Fri, 23 Oct 2026 13:38:19 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFTL-0000000GOY9-0VHf
	for ath11k@lists.infradead.org;
	Fri, 23 Oct 2026 13:38:16 +0000
Received: from MAILGW-DELL.dell.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 6808989ED;
	Fri, 23 Oct 2026 16:38:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=bO/ySbw6Wy2tlDziwBPG
	xxBRPseyc5qUYsYdDeHqHWI=; b=WELMJaNg+kQTpciqPACrxLoscJEsXRAlkVSI
	3yQWWNUo8OfsWoneriFD4hqEVP8sxxU9iv0ppQqilhb5ZTQ3LzRW4TYgGRAgM8xP
	COR94Qm5MDxQJt86SyP6w6vVBbgri1ZkJvHH+VjIUzc6PKLdG3ip/d7gGpdS9PO3
	WWx1OMF1oF42MncidewQfaRjy89aZeyV/mAeoU6qxGbEmXSYfC4A8k6sjen1j3gV
	AWv+jSp3AHDBfjPsV9UPkS67kvCDl53M11XyCrsi3OBV6h2ZzdMVUm1COFE0Huyc
	cu21eHYHu/ixYv+ed0jSoGhlw4W5EmS96X9wrSQwPDdTmVeAOA==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 0C71D9014;
	Fri, 23 Oct 2026 16:38:11 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:38:10 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>, Konrad Dybcio
	<konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>
CC: <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: net: wireless: qcom,ath11k-pci: add QCN9074
Date: Fri, 23 Oct 2026 16:36:57 +0300
Message-ID: <b12f9b35def027947e5a4b6328c68d1a70d3c97e.1792761470.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792761470.git.me@andrei-z.com>
References: <cover.1792761470.git.me@andrei-z.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_063815_341771_D9BCB7A2 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QCN9074 is a PCIe 802.11ax radio that boards such as the IPQ5018-based
Ubiquiti UniFi U6 Enterprise solder down, two of them on different
bands. Like the other ath11k PCIe devices, each needs
qcom,calibration-variant to select its board data. Document its PCI ID.

No supplies are added: on these boards the radio's rails are fixed and
not under software control.

Assisted-by: LLM
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index 0162e36579..605ac5e01e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - pci17cb,1101  # QCA6390
       - pci17cb,1103  # WCN6855
+      - pci17cb,1104  # QCN9074
 
   reg:
     maxItems: 1
-- 
2.47.3



