Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C2FC98321
	for <ath11k@archiver.kernel.org>; Fri, 25 Sep 2026 15:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DKvmXhpPlBR3vI9A+Drw/VIkw1kzao7rZBY+Ap1mi8=; b=kKcZzZRb7f+ur0fP3x5ukVZOAC
	FSY840OEHlz5ZxCCmOrJWxnmOAIMeK3S16gCHuVGX9H6GwIjiMyNV12FwZfmABqhdkhVgYIthdpMs
	/Hc8bk+vS7jdnuNMRCEygAfvHE7zROGx+KP3qn7QOv4tgEBHn0IQRiwrM6IJXSJUh7HGyty1laXcK
	RxXeu+JgudHamwr6lyzAMzUEMdzDljKKfrd+D23g2v5RlOWz+YfkOay+XMU+vd/Y+NkWfOuIDVggz
	DpVWsg5XznfJ9axXmiI/Qi9yN7bSCojg3hJXeM2OiIUzqaWEEzDDj4TRMX31pIq3YVjl84lv+t4vV
	QGvETUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pI-0000000Dmdg-1yxO;
	Fri, 25 Sep 2026 15:27:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pH-0000000Dmcc-2Aph
	for ath11k@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5DKvmXhpPlBR3vI9A+Drw/VIkw1kzao7rZBY+Ap1mi8=; b=DEp6BuHNZfmFj6aWDkFdgwPWnb
	I8qQbrKPs8qaTCLemytvbIfBgFjykQmNoSwvmO6Zg3o6X9NHcpd50sP1Ro+aP6R7XhhxslnvqaoOk
	DAEA/60eYb7sLhKLJheAA/s8WStprON7bko6QGDD8wtRXShKcuk089GAJiLmY+lubyLAFbo3wYGZZ
	S4gowal8EtIuJ4ZB6LoVAhKBTslAlijXObX4R2zT/Yn9PYk57vCacNuRx8p5kzj1T+VbjLn2ZAtHF
	N5U/POPPeR8pLHphc/oDQ7q4TluyYxo39BBTvGQwRs36dbnKa8/P5QosfmmjEVZh3akOSI9l/Wt+5
	JMKXFbeA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA7pE-0000000H3jF-1Kpl
	for ath11k@lists.infradead.org;
	Fri, 25 Sep 2026 15:27:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLhVM900428
	for <ath11k@lists.infradead.org>; Fri, 25 Sep 2026 15:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5DKvmXhpPlBR3vI9A+Drw/VIkw1kzao7rZBY+Ap1mi8=; b=dUv8z3s0k0KBBbwd
	NNjzCGxSoFZpRrYh4gsf4b/rsVTNhsq3s1WxUbIhens0l45BT0yRCL5JuR3Bz3yI
	sSQarEpn1fsDZxH5W+YCaddyiYHMM/O83wYkAkNE5lgV07rWL3z8R6oPZs6F+6bF
	bVXroe4y9B9eqRxscuLFPynjV9gFvgm20WAmAAW7u6C6g7oxCVPTZayz7AB4elc5
	fNkQhfOEGSU/HCuLiUIYQs1ROYAN9sH+AgCBDCvuQMeNXz+q7w6AI+9JT8bwU+Ot
	klN83LPPEgQVFGLBiWS7Fpb3Zh8Q6jlyOFaG8q40iDQJHWDZA0mPYvmKGW9td4Qr
	8bsMWA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr100sp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 25 Sep 2026 15:26:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso763468a91.1
        for <ath11k@lists.infradead.org>; Fri, 25 Sep 2026 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350018; x=1790954818; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DKvmXhpPlBR3vI9A+Drw/VIkw1kzao7rZBY+Ap1mi8=;
        b=F7eltW30IwxKjDSCsiTjLPSssi/LGMbQrZsjXVGn78BjJTzgGJlB2Z7d9nLH0f/85y
         DHuWPcQC4C+4T7LoUC6hSkGfOVZETIy7Zl0rBAY8mhAjGptqxuDVuQMl66i1GqpUXjjc
         94fS5DvULt5G1e3BfqVXB/2Ls0S6WGRusFiar20s/Tp58bCROK/3okrIjo6a3VBijxDU
         X1eRYeajU/clhDnexq1vX+b2iF6urQ+1QvKzDcjhygAnmRwaillar40vIHr5qdLmjXaY
         Ijb/Er9GbmQeKZ/AJXe5owrAfDj20n7qX6bFQ090lmzZoXOVuULmA6kozLzL/FR01+J2
         SUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350018; x=1790954818;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DKvmXhpPlBR3vI9A+Drw/VIkw1kzao7rZBY+Ap1mi8=;
        b=TwVD9bfUDplyKJhkLYxxTDofr49ry6tT7JOj2i85RC0oWhqUgj9p6eawNcoer2+jhe
         RAz2zpFAUcesRkk0rrjdYsHFzvAbdog2EfLvrSDCsNfsLgwDiLyl2PMSXipzetRlDd8d
         6K/cqAUg8ZzpOerHGRZfCUfKs0Z1F8A5dcV3PNdyomLA2n8+xdAsnJQHPAqB00W4FUp4
         QpcDlF4unqKUpYYQ+CbpmNfsqond2Va7dlxmjTZsuq7eeoPFcUmnYUhVf4hDEwYuYa84
         NeZMezRy6PP5KkfOlRI6KEMAt9bR6NFnlmzU7pRN18Ct1gZbrH1Eyyc+ljaTtC5LXHuu
         3QGw==
X-Forwarded-Encrypted: i=1; AKwUvBwcAn5UwwBkeG6pO6d1v5OWqoFwb7jUmnWXhe7yew8HGFaQ7KQsga2iJvSlen3kz09ZsiGqZxQ=@lists.infradead.org
X-Gm-Message-State: AFuF++lsPUh6fcAB5yHsDb1czzF7l+AzFUntUk4Y+rY4IOfyodFnpcJG
	CEiVnqI0lWDwxgAeyrGlYk+NouF0XEzI0pOvO5WHdfCkcl08uaZ+PrVr00AihwRcW3Rt3q4dZme
	Tp+YurSo8rQI1JW1k7jp/Ny18uEpkwDL5UsB8y21tWkMkqjbKcAy1mnNqxDCI+Svx
X-Gm-Gg: AYBFou3ywI1tezCkcdBakR9eqSjFe5Zc+ZnOsjCgWadpfRr6YbNmCi4zcN2NoibCMlj
	vmTFO1q8PvtPOdU9CotV/HgwiWFI0tt2xmiSMKbEg+k0l6o1ZdZBWIrLhyqyxcZhhiD3d0lQ7NF
	z5TPkCFJZGQZv3Gz0TbWs4Vf/1HjWbEWYx14RMVKZweDcokoezj9wvdJQ2CPEu2zo6qFeUOnvR7
	li60xrFl4gXzsE/H6F4WWzuKJXIoIWVnp8UOhE8I3dXnTKd80IsFJ9/RdNfn4VuW16IPZVWA5aD
	8v2ZI3VDOVMsyZF9xlYNbdjr0ORjz78KO07DOPTFVZ8nJHFruXHMk3nWcA0yDvB+ZEvtQs77yOS
	3Le3BA661FaP35N/f4ZehQopWzrWMpbNUjI2WyZRePhja3D0pPYaZwz8=
X-Received: by 2002:a17:90b:3d8b:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-3a098b444bbmr4769220a91.25.1790350017902;
        Fri, 25 Sep 2026 08:26:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8b:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-3a098b444bbmr4769195a91.25.1790350017326;
        Fri, 25 Sep 2026 08:26:57 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm5320405a91.0.2026.09.25.08.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:26:56 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260817-reg_info_store-leak-v1-1-77025a99b074@oss.qualcomm.com>
References: <20260817-reg_info_store-leak-v1-1-77025a99b074@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: fix reg_info_store leak in
 ath11k_service_ready_ext_event()
Message-Id: <179035001623.3875741.2110365933382475990.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:26:56 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX5FHXoM5yHsd9
 Y14O5Pw/WY9YJnk6okKe03xdxRWTfODEJh55A/SOC1dsFjI2MFUT2i/Ct8JJx9q5Jmo8ycJEEiQ
 21sCoUcWifEqBWqh+7kg7uhVP2nKBv7MaJQFsnzIEZTb0dLCKC8UFVptKjLHuznRKezo5bBjYhy
 XZIEtWSoZf8ADnRGhSwRmEHWMhHvTGeBv+AJgdj2T8RMjKhcE8+zerIcWfGbdUGdT1R683K0/YB
 sIYkifIVwKXumGP6ZAK5nCzikbDYdsA33mZvcW01FfpX/Cn4v9C3OVczbyu1IPdMxQoZ/r7vLZr
 zvEKQLJMIS6eDALG/jmMU5QwE6Wqrdfxx+kuLZjOY7ZDXgZouU5OTv+No6Rga/89kJwWM2uhIOk
 hLbzKFqcicoIBeyE0n6LO745qEMAZumWudMjeEDcCLSqPDPXJFwi4MtPmVuJlsQ8bByUrrUob/3
 MmPhquGSxaKqZjYFCxw==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab692c2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9eebIFysW1Mfredz1lwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Nbz6AkSNhJFUkEt5ksLRwmsI0YlJHUBc
X-Proofpoint-GUID: Nbz6AkSNhJFUkEt5ksLRwmsI0YlJHUBc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfXyphC0nJktnep
 usRyf65MxPTdnrgeasSUeq00IbALxzAxuC2gtoxJNN8Q5e1Ee5bXR1rzg5Veri6j5SKq60ViGwG
 Cz8EE2XaUSfCbF34qk0/IARrkq6fA/w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_162700_670125_682D9A6E 
X-CRM114-Status: UNSURE (   9.14  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On Mon, 17 Aug 2026 16:46:34 -0700, Jeff Johnson wrote:
> Currently, while processing the WMI Service Ready Ext event, the iterator
> in ath11k_service_ready_ext_event() can dispatch the HAL Regulatory
> Capabilities handler ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse() which can
> allocate ab->reg_info_store.
> 
> If a subsequent failure occurs during iteration, the ab->reg_info_store
> allocation is leaked.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix reg_info_store leak in ath11k_service_ready_ext_event()
      commit: 64828f091c7de5c1324427b140fb545f93ef073f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


