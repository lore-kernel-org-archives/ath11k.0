Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0E6C4450A
	for <ath11k@archiver.kernel.org>; Tue, 14 Jul 2026 18:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5+GJ0P12f0uqBrDr1x6vwM7QiP4mSPEkgb1duq1OVA=; b=Nh4DLPWowQEVaTOgfrGM+V1T93
	5GODQjaQ47Wj6sveD7oL4lnSRIZAMM+j0vDVH3uP3sgRGsW3Z6nMaheFV6Yn7TGCS/KBJMa7tlZYD
	I17u5SkXtJlb46r86GRJtBHVZ03hb6lDDBwiwyfsdLrCQ9hHhQUFxNsYVxlgatSe53PDJg0u8hVxF
	HYTreh0vrV6I01+XfxoNqfE2tTAOv3ITyOwVyNCPZh9DyiXCU+Hm+wIzRX/c0+oxIBkb8hLoBixv2
	6YrIRbsCFJx5CL0WBfcxq/pL64Wcu3oMOTxkq5tNejGYMys/JugJ156I0X0l3RFlviFVQPL36dTMB
	RaLrr9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhYA-0000000CqF9-2Vt0;
	Tue, 14 Jul 2026 18:08:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhY6-0000000CqBF-3wkv
	for ath11k@lists.infradead.org;
	Tue, 14 Jul 2026 18:08:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG75YD1091274
	for <ath11k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M5+GJ0P12f0uqBrDr1x6vwM7QiP4mSPEkgb1duq1OVA=; b=Z2AtfgTZLeVOwFfg
	sDAheMJaUnnhqK9mdnC00BNpvPVI87t5I3w4AFtuq5zfvdoGAxd/caS+7pOU9/iD
	67fyB5bVmtNXVN7T6miOGXbSBG+lg5ZErT6pQ1oERxbeQgbOqR53/gWN+e755ulm
	CsbBvV3bq2p/BPxC+PKmeTH79J44ZTF3XTl8C0wQUN4Y6Jy4K4Q3GexHJoRjmxDL
	XhpgSW9y8YlO2BM4lWIwia1TeGvsqcum7SELEZcJnyXnB43uh6FVWV/bNX0ObY8h
	Rt8JrS/w3FbjpcJ5gZk4lMRpRjyRVtvnoLC4ogWNy/cqekRisgi/w+TkPjitxGbH
	FYnzUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudjge7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so125028985a.1
        for <ath11k@lists.infradead.org>; Tue, 14 Jul 2026 11:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052485; x=1784657285; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5+GJ0P12f0uqBrDr1x6vwM7QiP4mSPEkgb1duq1OVA=;
        b=KC7HI7To93SxC89/0kmiFLFaTCMUGt51h5psySX81fAREDida0+diuSWMNA3eKjFVR
         UQLZ49Lnt2HPyi12MH/trnMelt9fri/Kq378NqtYr+5+Gk8WNAeO2AhB/kh/pSmkTNTN
         fXerDpGB7MHKop5iM1vZ3X2Ey68kRkUid0YfEvv9G8rkvfxuxWvGxEKW/GDG5OlG7yFG
         i72sCIcqVcS3WJ7L2Uza8+qUVbUtTTnawSfigh/SVHTTQe3VNTdjdHJT47R7Lk6jZ1Sr
         wUg5BQHnGwdVrthUjwpLr/s3r729iTnYB00bX3MpaktciMz8VKrFaXBmAS/0uMKXcVA/
         NYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052485; x=1784657285;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5+GJ0P12f0uqBrDr1x6vwM7QiP4mSPEkgb1duq1OVA=;
        b=hxfkpcyU5KOARRvNTBWKVCyM0pyJeP6Q3eGkzO6YuxYVFQNdDUhIcG2+T9IWfpkfA3
         nLzWXPCoqlXwA5TbHWEcSRmdAAHgAriSu+kF1wAfX4oDPLLyzm5OjbnqggipbdaNWnQO
         9DB2fcY0SxnzH5cvPXopq2xmzpWrlJR21it7ijK/2M0JZE47cZoLaXi8wPsd/xqNMCE2
         tdP8uOZFf8QUXicsFNJm5cbq6yZU7TLCdDAVNWc8s5AroM5xdnx1j+Cn/qLSlJ8tINlb
         425tmDd3wQRFk+RKxSzlybtbz/CEHB8Xs8ORL/JeVoG+DsWv+hHe8UL0FV9Z/jSRmDwj
         H5TQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWVOzvrIzX/LmXt1LOXOTMToDJOfkE5im/gOWcEHKNTc8aKPPB7OODVbHo5LMAbz1n4ZhHCI8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHerKmwIQH2ycJSZKJe/QJ3r/hXo3EZApt8DDsgrCU/ZuKS22z
	5NOQOOP9boyJ0fkDmqjBrR8cHbxN7LKeMNnjzCyLrptDLoe3Wo4mzCEqdMnHNF2AEq4ySWcOyeQ
	yU66tLy760D4wRoBgLPGhIlS12kPAtEnwkeTJR3xSq74zc7unE38wEo2x1GFUHPeQJqYxNEJe
X-Gm-Gg: AfdE7ckjZ3mKUXLmfwKZOqFhoHWzYb7aVtcDK7acG7totpDRbtPb2KwZsEyPodbR8VW
	6IUG29Ph6Rdsr5zPBaKX4LLN/yX6sNpDNSVurJgYvq+Paiuu57OCpTPFUEQyE0xSpCiZbAxKplt
	RGv521FlwLDYUJrqqdnmI7IMj26UzwoijobRwV/+9WSfoDRzuRgmzpqNYNxaSfMu5XKxnpO26Z9
	2i5ywQOTx3loLKAAD1wKtSQtTf1cqYBL9o/awdHSeaS1mheg6Rda2n1yxymFQVp7dsFvuGcP27b
	n0h9zw/WaknKhxwh5dBVz2FsxBPTz5uDpfX/VD2dXsp8zqsfnHXZml7B3I+0XHG1oxW9K62vryM
	bOQzWDpkHxbR4fdtzsyxBQe3ByJKorHksUqZcvZWkipPmCewYfjH5T+4Ex08apykr/w==
X-Received: by 2002:a05:620a:4505:b0:915:e8fc:1396 with SMTP id af79cd13be357-92ef3d1b889mr1306804985a.13.1784052485217;
        Tue, 14 Jul 2026 11:08:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:915:e8fc:1396 with SMTP id af79cd13be357-92ef3d1b889mr1306800085a.13.1784052484626;
        Tue, 14 Jul 2026 11:08:04 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:08:03 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260704011040.26233-1-pengpeng@iscas.ac.cn>
References: <20260704011040.26233-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] wifi: ath11k: validate regulatory capability phy_id
Message-Id: <178405248316.4102418.3725442894895717466.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:08:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: i4FllQWffjyhCGtbgmDJ3unPC7_BriCz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX9e+wy8d78Gme
 lAsFAC5gq7BYW4NFqA27mjbVlfAiErHw/SpDTp3VCfCn8naPsaK5IkfLkaubV+CXYhUgmdfc9Fn
 pD8aNd9u+xYOwzrELqk2KBl6kWCHLnDQUk2cfTPB4xKMX9MwrBUk0J5CzXV9LXVfHox9XUxRLPi
 PGM1Qt8kTnBwv4Rj1qN9MfQnXy23tuhoeDeweYmHx2soGGu1gTgMX/i6SZGKbvCWVP4T13Hs/GS
 c5+/uXaCPlI0rqk2m9ASWtexKpLKaXkt3eMdG5L9KctJoKtxSbUb0ih9dhWaCjOS15+1MVYttLc
 YPBJcCiMZHdnwhcgdrynu4EWmuC4q9OFKB7QZI3ts30Lbd2Csdr6UWa4FGN0OKzi9mDGy6XwnRa
 2GF7Z5gDtBucLhynfJ6gNovJbXWl11xTZMOYA+ISu1EL1A03f4nxnqcsSY3J3CcS/X4Ry3PJ6hp
 F8sXfJWhuMEvpzw8UDg==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a567b05 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TIgdfdpnsFF7rSLKS_gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX55+XxATdvuv+
 /rkC2zQttgR0VGlq6hM/NZOA/n5Tbq37lZeUGMVDpAItrPuB5SKpvuMMJbIay9n4V1bWAtOGBBT
 Gc9cq75EfExTDOKbfrKCP2ViVgEYr48=
X-Proofpoint-ORIG-GUID: i4FllQWffjyhCGtbgmDJ3unPC7_BriCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110807_135817_0F9B79A6 
X-CRM114-Status: UNSURE (   9.41  )
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


On Sat, 04 Jul 2026 09:10:40 +0800, Pengpeng Hou wrote:
> ath11k_wmi_tlv_ext_hal_reg_caps() copies firmware regulatory
> capability records into soc->hal_reg_cap[] using reg_cap.phy_id as
> the destination index.  The loop count is bounded by num_phy, but the
> phy_id embedded in each record is not checked against the fixed
> MAX_RADIOS-sized destination array.
> 
> Reject firmware records whose phy_id does not fit soc->hal_reg_cap[]
> before copying the parsed capability.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: validate regulatory capability phy_id
      commit: de4685d422a69a61f67e2e2ffdb5747d73d51308

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


