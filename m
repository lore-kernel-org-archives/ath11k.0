Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB77C43458
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 06:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKmY/uOXImK51f4X9cubEpPbPNQzK2Zc4IKfTxxi/cI=; b=GY0CSbN5TkeYXqFktKy/8gWXV6
	0cShV3Kutd0fH0ebP6zjxr2BTkcTlpRogi91jAAjQgl3ScPT8e3d5EIIrUoPnL/8XlNQv9BwLiKU+
	SZ1esMfTpbvIeXu0Nnbj+qPKu9L5B/CnrlT9zFPxsCqyZrhj0Snh2qf12hynKiVD8TwVhNnnkmDXG
	LHLjTwp877GAjuoUUs11nUF6TPw7Tgh9aWypk1b/JreCYAsTR4tG2rHsR3R/7Qg60J34JcFd/wHsI
	oZTfNbWdLsZZN8Ceqq+4pn3dOpcNJwPxBgkW1QFzxoLFWqmMGyId/hQHkfIECYTpiAZkw+VZMKFts
	rtPtkmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjA3U-00000008Dzx-1ApW;
	Mon, 13 Jul 2026 06:22:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjA3S-00000008Dzb-1jd5
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 06:22:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3A6OK169919
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 06:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKmY/uOXImK51f4X9cubEpPbPNQzK2Zc4IKfTxxi/cI=; b=WK6aCM5VGNlkRX8s
	pwBKRzyo45ij9jJmOJ/HYD/vMWTECmV8tu6qM2i8AoFGaKMhdZ7PDU7yXeLToCWz
	oKvlWqC1LQ20pzwKoOvY/M/rc7MwrEDd7rDmLWLzAS9wxvZV1vgWqeYR8sblej2L
	HvsOZ6OvtBqOJ2mYmrpBrpCQ33fHOBBzB03uMC6IA7raMEk7maCRX+XnndovsRNJ
	rOUryuAStVMfjH7Ux6eReOP9XuhRFPLT94EtK6o1Px3kUBPA8zqTyieEsRzixm7U
	foInm+EIZQyrZKcbF5JTvksnvyidjQ6qzVxC7+gA78r8bASWemWkGLv0/WbGQMnc
	TWumGA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehmnnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 06:22:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacf17c7e0so37369445ad.0
        for <ath11k@lists.infradead.org>; Sun, 12 Jul 2026 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783923731; x=1784528531; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hKmY/uOXImK51f4X9cubEpPbPNQzK2Zc4IKfTxxi/cI=;
        b=KPSSewKkKR2X6wi+Ecx6GVFWUHr1e+9wIvLR6zqKUVk0YnSym6U7DCzCUd/asllT2M
         abjP3RyJ04hU/PZFjV7TUTKc3AUxAGs5eTpQ8YXi8O3L78MyVX6wJ/nFA0NqpKe3OCEA
         VLjrQbzuUusdz4y04cANTfXETQzN7mdhSKwwQdwW75cQ6H4V9hasMBxX2qwRqA4z3wFn
         dh5tu6iTrtJD+edkJvDAbjW/ZmYVXYdT57DuXxu71Omwt9/z4An2mgvTKP9o2HJYMIwO
         G39Ag2fWEEc+oXc7P9K4hEybB52Y93MSgZi3fIqWwXv5DY74x0Ap6ZIi6HUvW7CBwv1Z
         FUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783923731; x=1784528531;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKmY/uOXImK51f4X9cubEpPbPNQzK2Zc4IKfTxxi/cI=;
        b=oB7Vk78mEokCh3c/lUccAXf7l5AnMGe/5JoCD6B9xQinsJEnmp5SXugNbAQiRqbNly
         MSk096+A5CG6fvjOdmSeAQPihZvrgsnnbhour7wxNI2oN3mQ3MxDOPlH6YP/B0N6b/cd
         jqAnwaGdEHD/UfQ7TSndK0vZFiIwnC98NZRVrhvx912GSF/6+yvIR//MTm2oQVp+NVKI
         4nsaDUhSFUlqLLbyz9Pbm8qYUNVP23TrfjArucJtXtSDMx0dWqU89vQfJjSRrRbwQSIh
         Lr0uqvoZDDS8E90aPLpA6ikGakFSpJI8w7873hccl+g/lxzVPCdc54kTZxR4syrLacYv
         tuqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpB0QPSQvWsZEQcu2r4CtBGYCJfwmUhMg3yEqccojl8qKUs40Zi9HaAnW2fFybcC3RN8O6tc60=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBWyA2sQ2T1hi+H/L+1vPU50ffvJXN1irwpJUjRxKikSbd9KXG
	vEW+2KB6jQpTMneFKPdSiFO1CoctFPMWLYtZyOvqDEuRumOygeykbDFVSzJpSFmSOafeHEU5uBw
	z4Bpcm6S2zyIpTSTtVQdjrSKQbGDQnINkArYnvkZ8FKGNuusm6+A/4775nv4hsZ9L
X-Gm-Gg: AfdE7clpeTTforyHEr1II4BYWOmvQL3hG1mo0U/i0KCuYYKOtLZ4kXkd/cQ0yHRVCOL
	VU2rdt2uB9fVr8KVB0NR1W4KqMDPYBXW2gRfbs//LwQ3iBcqhme8NFEk9XTUAitGtu+/c8VGKBH
	uBJXj+KtT+4IDxzVFvHaVR8wH0rtNGVER0ByT6HpZTkUoQqt0iUAOC/eDItiMYRnPv+yLUtJSfB
	v8wr6DHjSvmW+v5JKL8Me9XvEN4Jvqb4yoOGYeIrbqcXIuClX0hsPNiwiCi3oOD6O7ctjbmHHRJ
	daJCMArTDCez+erKkKkVCut8RJEMp9dKg1qjgzCN9h5QtKR6RRsDciE8ZS8x0TADZHVRvfmSTh+
	MqPbxYyKi1biYGwTO4vKrBopUBcaA0E0YkwyugTEo9PGG0NeTeutdU7cJJ1xKAIB2fcVPa2XE7g
	gzF2L6gfY=
X-Received: by 2002:a17:90b:1fc8:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38dc75f4cf5mr7627850a91.15.1783923731280;
        Sun, 12 Jul 2026 23:22:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc8:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38dc75f4cf5mr7627830a91.15.1783923730824;
        Sun, 12 Jul 2026 23:22:10 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38decd9a90esm1516249a91.4.2026.07.12.23.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 23:22:10 -0700 (PDT)
Message-ID: <6e36d6c1-9a07-4354-943e-d72d6b6af5ac@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:22:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: validate regulatory capability phy_id
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260704011040.26233-1-pengpeng@iscas.ac.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260704011040.26233-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2MyBTYWx0ZWRfX4wTW/z4KwPQY
 Kkwik8bu8NC+71X/Bn3naI3RVYhNHUKl58U9LQwZHMEBRlUNxZNwAjUSzOJhR1BrHSbIGR7wUqp
 MZwHEC8xhMKFvlPEnlA9EMfD0W37eIo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2MyBTYWx0ZWRfX0ILVmSGNG3C0
 7/3IxbntrNJGsUZqqZOuBOMIF7/4j4XT+bqW2BJMoEKJOh1CEC0050My57kVP6QWTh5P6ScD2v9
 p7fGfqm7ef9PEUf+86nTzNl7NrUFGyUj6/QwSULnK6WgJtifJZRpVzlhD4OC6loTReQTaePPZkF
 MGMtUHO/jKyuNrVqrU+fqgxA6CpF3ZrK0DNPreEhwiYqQ8EdXiJcq3/5H5TLym41FhdgwfBJdvB
 WaBadn+X056HDSlS1pICzF+HgsbCbpepXWqSDQGCZ48ibMbm9hvt89J57EbcETEVZPzVpEkMI9Z
 6951FeINfDztlqqPErA0sov5+oS9D7F0nNNQ/p9qooGUMf1Ioo01xWz7TkzWudVinqfM55c1kIN
 daBBviCg8UYCn6OqPl+JtxFwh9lUdk2osxqwxqpHHTJiZkDUH6kYw0xbDMgMnd0ua3eV2xv4EhW
 89vQQ2hJMJTenRv9DKA==
X-Proofpoint-GUID: qEMkguEgagcukoVFd5eetd7-DFtEOaTp
X-Proofpoint-ORIG-GUID: qEMkguEgagcukoVFd5eetd7-DFtEOaTp
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a548414 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TIgdfdpnsFF7rSLKS_gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_232214_600223_B1F66BDF 
X-CRM114-Status: UNSURE (   8.84  )
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



On 7/4/2026 9:10 AM, Pengpeng Hou wrote:
> ath11k_wmi_tlv_ext_hal_reg_caps() copies firmware regulatory
> capability records into soc->hal_reg_cap[] using reg_cap.phy_id as
> the destination index.  The loop count is bounded by num_phy, but the
> phy_id embedded in each record is not checked against the fixed
> MAX_RADIOS-sized destination array.
> 
> Reject firmware records whose phy_id does not fit soc->hal_reg_cap[]
> before copying the parsed capability.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

