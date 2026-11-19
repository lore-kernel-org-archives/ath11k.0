Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C71160A3802
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 12:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IJz7lQW7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lal9swpH;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyyxNgcB;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdtVXqGA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=; b=IJz7lQW7W42mO2
	puK0IT3xUE+//3YtHwJ0QWoPcZhHSdcVgnFddLvt5fICdIpcNxo8pYSKuEtVs5RQMAHoPjLFMQfUi
	+OSmxAe6cYbvohm9P39rNBW63XpImPkdc10cGwJsdc2MBxaAo//AOeFD5WoE3bo8ndPvjkVMwVw63
	4ZhMG+cxmV9M7FVd1u/umn26nU1rt0YJXS5SA+DNQeznHRCS6S4XtIEXzj3RzI03zuBjB7npHgo9M
	DmnCTT8qqc5yspNd02rBJOI7MSTXPsLr7F+1rdOiyqgiG/klUfAoMea2V/ME8lU/na/oinWdAKvp0
	e9uOefgjY6e1HjczFgfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hp-0000000Bwdx-039p;
	Thu, 19 Nov 2026 12:57:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hn-0000000BwbU-1zdw
	for ath11k@bombadil.infradead.org;
	Thu, 19 Nov 2026 12:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=; b=lal9swpHxZJGA5VovIVKsFVUMA
	9BVugs0iLbmK/cAvlIPjOoJEN7Y7xUIW1dX3DBYu4hrSlOl4eba7xv8SITwL/Sms64PNZ3Uj1YkWw
	XEh3BfBx9WVzvVr+t2Qxy0Xc7Zd+dKJhjFwiNY+pL+Di25sD2vtb76/lOO+7MD2RSTdfJVKpSL5cp
	MiRZETHVfkUSOmXZueTWfkfhqoOJaUg3L6aplKlyFvAMhEbfHuiMQIotsbHWx1LbPHBrmHrtfNxKR
	tNnQBernAniYcvUoz3/DGnofKmXnJmGU13J0ofvyl3mKY5mBC2ZBRJcR8CXwWfy+SnWw3UUahyjcl
	h11ysOZg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hj-0000000HEb4-0MDV
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 12:57:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkVOi085331
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=; b=lyyxNgcBYDgj9KbE
	qmrx/XYf+tSkmtbyWk2R5fDOlviDxyoc05zZdzmgl3+DWButP928RJE5AItYT+cM
	s4cFX+ar6EkcxU4ajGkcXdbQvBRETTlCVv4XAmwU+YJ+HzYAo4lwDU5vRQ89MbjI
	yeoGY6hxQEuvqD8yUAbiXCUyFjftFeqAf1uFcbzKRKuSjcMCX+zFhp/9lKM7SRE+
	MvKbDyg9JLhmzg8mxzSHa8BEt9XWZyYOMVh16bIgqr6dWiRaVtLqh5X1gB0izFfA
	TnCxesXlUN18Ppwqq8CQDl38cf6LEFvMhAmwXPcwZHuXFE6xnDkCc+gF9y7oCxFY
	O5ZfCA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2savn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so5304117eec.0
        for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 04:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093048; x=1795697848; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=;
        b=XdtVXqGADOnVYFXpsI+T1lGn+dMenv1RHi6LfxzjQinknNZYngRpF8nO4IjkH8mZ7Q
         +gmqX40jJas8qb5SFMKmejhQxjp5YSjv5nuMqWL7yjgiOJeaSRbla0dU33OM40AKsaUT
         LSpza6M/X1utpxpYcR3GoSyzJLRsotgkMjt2o6o7EW1aPyEeIocUYgUq/M67+diI77L6
         Xsh0e1Ki16jjbvDAwxzIzqJstaPe+/6YvJigXx0i1Q23MsiDceGPkSVZ0LOfdFWuLbgG
         +iFzkyDK7z7UgGDJJlgkVzZsqevuGhDjlv8NN90xlvW5MrxmITR8gY1BUcWRsq65wK/3
         /9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093048; x=1795697848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=;
        b=o821YSGntrh0Z14sxZAbVZYAOyZnpzH8oI9wOKd1rCfXT+J5xM9V2Ff/Z8hL9ydxV2
         HFfaqI70PeIKKcepHiEYX0dnon8sYqMRPuI/UO6NZfv/Tw3XXRRo/PNCBKlQajyUWapN
         Fc/51a3fLajgZLMYyzljBvv7o9qHeEaX4hDzd30ql6KXVw7sRXnIGCZZAkpnJL868ehh
         fo40wQYxP6iEvQnYNJMoy+d+NtmSgp0UVGOybXDoaRwqp1vK4QdxSAirjrI+JTWf9NaW
         f3M+TGCkSPcfzoL3doVHEh1o7K31Qua96QMJXPabuXotLKVm6l3n2WVzGVdm+mTsSpyR
         VUIA==
X-Forwarded-Encrypted: i=1; AL+hErFg9tdXMHOWocVSdlqdscK1IZ2UHwi24ijiup5DNqFB8pv8+wIFEU31atf7TgHxSuxmjuvCOXA=@lists.infradead.org
X-Gm-Message-State: APuU4Z8phPwSze2VPSZvegUmNxQvF2BdtksqD5ks16kATnQNk+jw+f7n
	Dq65XG5QtMZEzxxR+zdHRrNkl0CpsrfuAq4u7Jf5UsqBwGyA4iTStDrD3GvQIkKA8p6ajEj2qIr
	ovY2ajndtx3d1isryft4zT0eyF2leqbQB8HDW7QQocuTamCbPj4hoC47EUxJ3h8QPokmyJA8a
X-Gm-Gg: AZFdTZfz+vycRfgyM2usYCtg9Gica3LCmNQs7wvqy7yaELXUeRROszPvt+FUvv2I48f
	9Vd1wwuZ59kwHfhxuZvpOLdEoXZz9B7ZbF4LiMmwo42RaM0uZXLA4cwixgvPgxJpF1/Eo3yNtd7
	vgbYBs4SNg7UZ/X3EphOgrxn9lthqpwta0bxhFsY5XLTK6NfQdY2UVLlWeT6QG5qhfV9qUnJEbk
	ydgopotCZolCSx19Bd/B9t6Cwo7RuYhq/FKZcCs9/qzschAssWtW5MP88J3YUfesMgUJk4JliaZ
	H70ffXU/0m+0W8JxbiCOJmdBMmtrr6r+ogxAdh24lhVJOlW+BEs9nK385+KUpfeU71FzpJlHzGI
	LVAA0/fKShLI5HJG2qfWO0PBHZHqMwp7zMh3XDXLbjM+K6DL/bB4cjM4xr2PSReyrn3e0wUtndS
	kNLZullpvA
X-Received: by 2002:a05:7301:6f8a:b0:381:7ee:d351 with SMTP id 5a478bee46e88-38280c30d3amr6041421eec.15.1795093048280;
        Thu, 19 Nov 2026 04:57:28 -0800 (PST)
X-Received: by 2002:a05:7301:6f8a:b0:381:7ee:d351 with SMTP id 5a478bee46e88-38280c30d3amr6041394eec.15.1795093047773;
        Thu, 19 Nov 2026 04:57:27 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:27 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:38 +0530
Subject: [PATCH v6 6/7] wifi: ath12k: Add support for MHI bandwidth scaling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=3223;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yAllDll9YCBe68xUUxCszpos4lvTFYNXK5z/BwyDl/c=;
 b=+k1xuH+OKoHdW1RPtGLjE1H45txjZLkvtl/v7yQ80cCbYV1mjZYC938l9WQ1zSE8XTI68IedX
 Cs+qfOOnDbNCo9/sL+ruhb2wxcVo6/Bui29ICuhdCaqKSD6tDrSweoj
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: pOQsjT2JqSFSKlX6ISY4HaeyZhjD8xYG
X-Proofpoint-ORIG-GUID: pOQsjT2JqSFSKlX6ISY4HaeyZhjD8xYG
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afef239 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eVNgtL86jhWfyD6ZVDoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX5pBwTJgDFnoe
 vm4ledNSWmkxMxcEEVEAxHVBzpfnSQ2zsj2DCe+imUs5lJ/xwvABphb0R6BfA4/0a72zGSRmm2Y
 qxaW/A0AjWwLZc7wvEB7SfjnzMj95EU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX9M9YF8+gd1gC
 RuykoGDhkQ0oBgy4GDzbS4kGvaRlkfGy9gk2oyoh+RI5OxNP9E0dUKdjSwDtZVcGeANmh0JcE0p
 RH+VZ1MvP3ToX+VFG3QpbasNb5aXkb4rJxmrBmVqDbf81L8JI7K0SOLRPCN0jHCTd/dlQEq5u1m
 i24AjmTu+Kyci9uJCTacTaHXFch9G/TjdY4/u8tAv4E9SO2FFrQGjofxC0QrDAvuvz4DruxT9wW
 VKs4V6r5/877Y6EE7i9krzC6O4cyktdKy55YzeHuk+VPnvtrKp9jWp0d00f+s/tTODvziu3SWrg
 oE+U16fESrENLSmdEq+wV76tcwZP0BUN2x/RDRFuIJD7EA0te/OFSO97f3s2+uQ86priTPNFPCB
 6swV7fsfjRNSxBgzaUk+SRNA83qFhTxyvaq+OkYD8cEN/RuhfhGjv2D3CO0ELOafevNAhfMVGGO
 bManMmVukVqMq2heetw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_125731_790709_68D10F9D 
X-CRM114-Status: GOOD (  16.14  )
X-Spam-Score: -0.9 (/)
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

Add support for MHI bandwidth scaling, which reduces power consumption
if WLAN operates with lower bandwidth. This is only enabled for WCN7850.

Bandwidth scaling is initiated by the endpoint firmware based upon the
bandwidth requirements: with high bandwidth data the endpoint requests
higher data rates, and with less bandwidth it requests lower data rates
to reduce power. The endpoint initiates this through the MHI protocol.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c       | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath12k/mhi.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/mhi.c | 12 ++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index ee87f00bc5de..16d3f299c47b 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -184,6 +184,21 @@ static void ath12k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
 	writel(val, addr);
 }
 
+static int ath12k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
+				  struct mhi_link_info *link_info)
+{
+	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
+	struct ath12k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
+	struct pci_dev *pdev;
+
+	pdev = pci_upstream_bridge(pci_dev);
+	if (!pdev)
+		return -ENODEV;
+
+	return pcie_set_target_speed(pdev, speed, true);
+}
+
 int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 {
 	struct ath12k_base *ab = ab_pci->ab;
@@ -261,6 +276,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	mhi_ctrl->status_cb = ath12k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath12k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath12k_mhi_op_write_reg;
+	mhi_ctrl->bw_scale = ath12k_mhi_op_bw_scale;
 
 	ret = mhi_register_controller(mhi_ctrl, ab->hw_params->mhi_config);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/mhi.h b/drivers/net/wireless/ath/ath12k/mhi.h
index 367432676385..7187394458c1 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.h
+++ b/drivers/net/wireless/ath/ath12k/mhi.h
@@ -17,6 +17,8 @@
 #define MHICTRL					0x38
 #define MHICTRL_RESET_MASK			0x2
 
+#define MHI_BW_SCALE_CHAN_DB			126
+
 enum ath12k_mhi_state {
 	ATH12K_MHI_INIT,
 	ATH12K_MHI_DEINIT,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
index 988affafcfd1..c482f0e04742 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
@@ -120,6 +120,18 @@ static struct mhi_event_config ath12k_wifi7_mhi_events_wcn7850[] = {
 		.client_managed = false,
 		.offload_channel = false,
 	},
+	{
+		.num_elements = 8,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_BW_SCALE,
+		.doorbell = MHI_BW_SCALE_CHAN_DB,
+		.priority = 2,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
 };
 
 const struct mhi_controller_config ath12k_wifi7_mhi_config_wcn7850 = {

-- 
2.34.1


