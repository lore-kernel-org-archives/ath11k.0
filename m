Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F18606A33A
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 12:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gUsnaENK;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m8nRjkNO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ml8DRb4n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=; b=gUsnaENKL1creN
	a+7kqY28QihJjpSI4kW5IcPI59uyUUY2a+Z1EwTgz/5mNvt8N92JsNZsgIAVu2OIbLIVaieBSxzao
	u5q/VjCfqnxK/T78dwpAEDc4yVcPqBPTug4RiaQ152dG0oURJsq09YoPXdIyY2bXhyMUQdNkMlEcZ
	YM1wQU/lkgdF8IaYiKmSK82xlb2vZjHq+PYVXe8m6FCBtDuF3OsNQSqZlhOt0XZZEQVaUlMUfk//j
	Q83xmCpQVXCVuaLhLrpZEZ89VSY948b9gGSkChPY/laEajfiR0ve2MJmdnTtkuvpyKLmCb38pgxtl
	L4jaPEabic4KeTczN/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hP-0000000BwJ8-2MMq;
	Thu, 19 Nov 2026 12:57:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hM-0000000BwI9-1ohu
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 12:57:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjx9h3319820
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=; b=m8nRjkNOW3VPr3Db
	nULsFpFVKB4d+oAm1XxQzMs6sU04/hZg25z6kvlIEnVyHGUyIFPeCuOSC1og88QX
	pD/n3jwP2ciTLpHtt4ovUbDQAHsEt1ONIpuWEaKMjQOnLdePpfS8S3A32A8rjVqt
	gGtzhWhC+pE8rPQHUzbCusc6542yrC0hxHr06nMMaC0B6hmld1rPbdzO3C2mJl5m
	ekCm4Dp7oSZhkKDWMTLnLUq6qeq7v6p169cp+FMPbjks8aavxmMhc+0qBNVzpXNk
	8O4jqv6bKsXxeBCRVwJZw7+SE4+IrwqKi+dVNguahul9MjaixLPoCEgYv+hDnG70
	suRBMw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx18n99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383d1190b49so1111723eec.1
        for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 04:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093026; x=1795697826; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=;
        b=Ml8DRb4nE6HkGvX8chvHnzzvugXCixoa12WSWWY48BSS9F1+TyIjHk+HQ54mgo6mkj
         sc22DcKLQN01wlib0ydLfDtkL+JBF4RgajAdMWHOrAxl73jU1JJZa4X9b2YS18OSXzH9
         0dsfLTc5HbXx26r8MJUlX5oNKnczh8YH+JfPQWT+aqFDgHLTRqNVMaz/1cytcEBRoOxT
         1bdmePf/W8pcvJsgoSAdDny3MzcgUWec+x4BjXqGNAYXJFtSk7yO3n6rSZtXxlCC5dUr
         Ps/Vxu05LYmtztFT6xUP1gxoQZycH8cArm3NDcNNi7Ym6GNKZ1YYPm3cXqftaK0Kk82x
         YnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093026; x=1795697826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=;
        b=tuTYtoA9KC4y06f+pI353/tPUddvcW8q9XvBfnXGrKQeQUvSKBOUmLNvVqb0vfHDLi
         8hcA0xhJusq2I659WYcN1RCsAKnkpXxJtkYhTMLK2dPaVpUpP8XV3daoLUiUgI/Zt0kF
         S8T7etk2VhpGfl+t0JWtMdXXvujoreI96xoD1/fB7EcTHqRliYzWcVt7pK9BShmoriGU
         kt8UnLiZFX1nXCtzs59P1jLhr47zKBcbzOrfClV0KOfe17ixhd7zY+812BW2LI4z7ETK
         rayeXamCx0UMHZjxFwbMQInes3EljwjiSY0vNJ4Rt8OoZK7ciFs55StlNX+DwwV6Hvmp
         E6Bg==
X-Forwarded-Encrypted: i=1; AL+hErErwMtAppBAoA3YSnhLSQ/V+whQvSKyPQExIXZh3TrHds5zSHfnyO9q+qfjI8Le/jHnzaGjzds=@lists.infradead.org
X-Gm-Message-State: APuU4Z8yiDQVO2OYwB69qcXyhowB/3XrgZU0hcaR9N5Nmjde+xAMN0RA
	gp6pFxtfscGQu48iuwTUHY18yhaLEmxC8LGISVJjN6+T7EtOAMxfqOFGB0tUpBBlc/Mm4lstw0v
	h6B02MZrgscdlDvz4QO9/n1Een5fmmO4vFjhivS1PEmkKGISUNyXH7eVZKWHK1HS0
X-Gm-Gg: AZFdTZe7ftTx32aVUwMG2PFDyset0VVlSVVen7Ea7HPIqABYajEVS+u8hnjnVrHcz4x
	AIDDLqtsx2T3pu1LStpqGTfPWxFJpJEBE+euOiIFC3cdY/EiEnR01HeUqRxDVHQOf/r7/rlAxPi
	P/eXshhTabRxauTDOQSELWu23/8Ruz/vdhC8yu1b7rnrd9/35c8cPLy45znST4ayYxJAmUejyjj
	zA0YGA4e8GAUNIvQidGXy0g00cICk/Au6IFsoAlqdNDqrZb7YKBd2IP/tkJyLK2JsDLHS9TFpED
	6dZZfwaZvsyC+LF3aCKtIpl1Y2AaoLjmcQcztXL797AUHbBP0msO6mEEL6QME3eSi3tJskUPdKt
	tLrwRGikPvC/w3URjWpLQ2D1AkfJSe4CuTBEWxq5hoM1tMsI5wAEjhOaf9gmPEGIELTRGHbr+Cx
	qPhV+gbsNh
X-Received: by 2002:a05:693c:41c2:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3828101fdc8mr4842009eec.10.1795093026247;
        Thu, 19 Nov 2026 04:57:06 -0800 (PST)
X-Received: by 2002:a05:693c:41c2:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3828101fdc8mr4841978eec.10.1795093025585;
        Thu, 19 Nov 2026 04:57:05 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:05 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:34 +0530
Subject: [PATCH v6 2/7] PCI: Export pci_set_target_speed()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-bwscale-v6-2-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=808;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=W18AFjHkuzlMzGO5/R1VBtRoQyqAsmAJi1evG/8xi5I=;
 b=AkA+fwfO2ceq8nugH0tjdw+xo2pslyfEUD1FzyiS2YWEXpHinZQOqVDEDsAbZ9lUz+gfkXnIo
 AFXVLo0LYELAglKOVKcuHsbzpeARu2iv9LhZUhJLhRf/a2lkOhivbXW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6afef223 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=JOcJ30pghDwnvxMqNTgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Imipj-UYdmZEGaexp67M7S0TzJdJzfMy
X-Proofpoint-GUID: Imipj-UYdmZEGaexp67M7S0TzJdJzfMy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfXwVxXQX0C6Ip8
 oYf/l2oQUZ6k6dkz7zVaxSxS+BOrYrTvPOWLGVjP9iJYQigNV2WpjHewSQel0WJgJXzAgVZFMVE
 eP90GVgnhnlDoQXkkFUnExw+x0Wru2BjlkKtTPCIzz83cDHzLNNE8BvVhUU46r2vMjyOBKSiQXx
 nyvRRLqPO7hyK49B6Y0WNfE/aAnHtaMoemtngO/Y9BquGeseIMp0J1biK2nQHgCuC75yXhNdkI8
 80RvIwMJsZNY7zaGF+QUuQWq6tK9y+/AAYMYVqlPTgOxpTLDVpSYTlvfcHtV8HtbgrYiECRr3+o
 EHsNAmZvfrkpyVwyG3W+54SpntgeTZ9KBA82F6R9c4toYhUQoqv2xD8etQX9kw9F96jJGD9zoVb
 Y6NfwGvSlnW+j6ewYd1oCOQ+syjY6PSpjSw8UBrquFSmqGQ1CT5XOKxM217YONxcq1qkITyiOlG
 OAdwfGrxCSp/72iab7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX8LliSh5lSqbV
 kaxEBeIkmZ9vltusjmtiilvmWHO9Nbrdam1kfjMwxKoj5raIN7or/w7DTAnGwxKknLiLJWSanp2
 c/0Tf69mL1WUhUL7lKqp3lj9q/vEnxA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_045709_585727_56F7DB53 
X-CRM114-Status: GOOD (  10.46  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index c1e749df5bbe..0512ec62dd5b 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -219,6 +219,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1


