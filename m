Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CECCA9ED0
	for <ath11k@archiver.kernel.org>; Tue, 13 Oct 2026 01:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=; b=a/6MDw5lNMWL28eUMfP0QQ7Sdl
	iwkqoU9RNDIeycMlPLO7dezTSg3CeVxEQWi6CNfPsBrZ1/Pu8GafrAJqE35MQqsUJk0DFQuXWsdX9
	DCQpmSL9uyyevebCyLYCuE8WbNLI4hwpOKjRFUcdGg4kAn+z/WLGdzaAvpkDdzaskT/82EWZICGdk
	cOKUEqNOVOudiEwbAQKalL81MxsJ7CrAMz3d538VJ/taP0rryW/puZGyl5KIhD9p8dx6Oz/SsaG30
	aSb3DPfllmaClx9QZiGuVsAfeNgvO/W7QVu4AkaHe+EuuQQYovaK/A3NCQyR+x9HGvVX+pnEAcUpN
	ms4D7sjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGQyD-0000000BjS2-08Py;
	Tue, 13 Oct 2026 01:06:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGQyB-0000000BjRa-3DAo
	for ath11k@bombadil.infradead.org;
	Tue, 13 Oct 2026 01:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=; b=qprFsdBa4GjX0x6Ci0t6761IAz
	QLI062yIi1FwGE/NjxaVheHhWRY2kOntm5YM1BEmOuAS0BB5Tj8sGZaHu9RPcFH0ziPBk9bnCrYaH
	cb0feXFakBxXwYr68yuVL9w9MVYYKaSpaNE8UL/cKDNmbI45/24AJsOyFgAbWAKbqH3PC2J0gpwtR
	Oov3AFHd/JeQvjYgqeV3Pt7BOWy4EWQ+yVet03oO9D8TEBd9ksIYuWzHJ4rOxnUHaaDdP19Y34RE0
	TBDZgLx2uyM3mjcpcbW+TTI4HASJllPLwpdpgMGUMTrv4wxX7s9SIO5YI03raNyVgGVvSMczXvsw1
	RrqV3T0g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGQxy-0000000Ez9O-0Kfe
	for ath11k@lists.infradead.org;
	Tue, 13 Oct 2026 01:06:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CMuc8L4111321
	for <ath11k@lists.infradead.org>; Tue, 13 Oct 2026 01:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=; b=gVvlj4Iyu3w+P5Os
	Qzcj/4L0CUPcGh9gLziBe6aVEphPNK/yHDFPlzFEZW69sz8GRgQu0NaDa8/jrGIL
	2Hzqrd9OOSXctD6DH45CCRkXsk1ZfdGHtfzTIOrQhirjA5/hMtbkRwAxbPBIlXhk
	n1Axv4SFNL/0jD6wyBhQyruqVWaDzf6YWfmmfgAwwzOi8APkGlrJQOVwyc5GUrDD
	gVh14VSoarMFlMdHt53+PbzVMeLxHrZGg05uB3kbzFMBfd76uW7NO+m7ZRqm3HLs
	+fj1C8Jo6IgqR4ulYuHS6Hev8xNWu+i4JHNpeLvyavcDLxvDRRDTgswP5ru3UWbT
	GSV8ag==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq8ajp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 13 Oct 2026 01:06:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-143826c4a13so1349461c88.1
        for <ath11k@lists.infradead.org>; Mon, 12 Oct 2026 18:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791853559; x=1792458359; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=;
        b=dK+wopQQ/h8joSrqJgS4hOWoYmbc7/wbco6cYVzu/E9ldmCNMvrojRjA3Ei8qlhVfy
         mXEL3WdF5XgjCdqhdAsOLubDb1XZJdxK8PPQK7ksWdg114uQnWt6cZJ4BVagK3F8hoiR
         5wDGkdtbeCljUhzUMFO9NMJPwxNzWTrA7AV/Wef36M3PyL5/iMf6Mmsq6m9yzBIgSrDJ
         /abBnCyMglYlgc9ERHK6JUBlGrPhnJJkFxcivfOQLeP2Tf6+jatZX1EUeDIKz8ji8Poe
         PBF8y/dbNLPg+Rj4y3KL9FKd9OsFeD5VBgJfi0yA1Cs5DdkMNeuReR3enTMmVoixTUK6
         LbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853559; x=1792458359;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=;
        b=wb7fRDj3TciyPA0vpL8wzEk9looD0JOHuWXNdFGm0j/Sn3OBfBVpaZFMf8TvbDqBus
         gENVVJ0pay2enRhIPROQe3GIXEj+RWG83gey+8H+tWa1a4VeL6VKNRf+N9OHj5rVOLLy
         vtEPUhgE0AknCBxX5qhIDSuViGt168sC7fjDGsVC5XkQWNSIx3KZTynhg135zWwhDVss
         1RHmWBr7zCvnksW9hVu64IK3AEZ0PXVrv2zb5ll5Pma8Qx7iN6yc4iXxlmeHWU/jakG8
         nPqudG4bATPLDv2D2DfX2QWJzPzFjy7KekZ+EIS9qwjhpCGOVpigWLBcwVdyEELRzZYe
         jj8A==
X-Forwarded-Encrypted: i=1; AKwUvBwyusaY67/pXx1LJMoDAmoLlxn8h5rpgYA0mhQAP0JTXlO3HnJ9F51VHPMMJXJzkUEALavm4xU=@lists.infradead.org
X-Gm-Message-State: AFq9FYI37hDT/G/+A0VO4YvY0xuwfamnwYsze3kwiRtj2vGYhNpGwR1V
	w0QDD/sCbT1ARRRkYLktK3rPfhZGcxcR0GySHxMZZeg8XAeFA7KMKP2HMdISigYa4JqWJTyJdm7
	EOd5CeWeecRPe+UsrgbFb+wtvU665QXhZwPqMXvJlvT6i01Rnl+2Gu99LoBSecKkk
X-Gm-Gg: AYBFou1UFs6G15Yl/qPbLQzhMvNl2Ca7r5veFQCRm9pwD1F2NLRtH7wfGbE6nlF5WOq
	Q51RikrL7mvjMtQfaSxWzGbrSf6v8lw/WVLua0JOh9fKr0No4tzEGNF79NoHKk9q604n0ce5h3h
	l7UgSjmz0jRrAnJq2lqYRREDJ4CjqfYiCfWlrj4KzTRDTjxQagRW7TGMpNP1WYLxVoiULQx1mu2
	FTZXzDMARf7hN96/OTVGSVbKE+3iqaoMr/CtFv2FLWMInpGpnUN12SIFCfCwqhxFRO6vxtodehI
	gJvnb/NftCSA7M0o1sNDtf6jOXzrXP0WwJSJrv4vQWPy3RuysrYcLRXaWBZVSw/XaijY/lOwKCl
	151s07RPUTfL1BlY6d/XG6gBbn2EAlbvcKcPYj+DkBSncio+GBdPfcQA=
X-Received: by 2002:a05:7022:170a:b0:141:51fa:e609 with SMTP id a92af1059eb24-16a4c33923emr14320893c88.0.1791853558832;
        Mon, 12 Oct 2026 18:05:58 -0700 (PDT)
X-Received: by 2002:a05:7022:170a:b0:141:51fa:e609 with SMTP id a92af1059eb24-16a4c33923emr14320852c88.0.1791853558074;
        Mon, 12 Oct 2026 18:05:58 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm32904080c88.21.2026.10.12.18.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:05:57 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
References: <20261003092104.520135-1-yaojiale02@163.com>
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
Message-Id: <179185355715.3481009.13105817063716132761.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:05:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAwNCBTYWx0ZWRfX/LY1LBZb/+AQ
 pHTp5Yra8ftwkdjTTplt7Ls1rSPi9pnPoPQRmGh0T62x9K+knSq0+5xhGTR3MsxeG8yCnFogea+
 RsX11f+2sSy7oYsDZ1dy4QC7IVK1X7UacJD1clsHijvUqBXOfA61Qq+0t8LFqG1Vtv71DasBHpv
 0NLebTgU27gaPFl5ZtYVvphZPFxJEC1lCRUSZnsuZ6gnN1nQD5S4lwfXl2hV6MoLsuujVH1LoSx
 chnbhkcvEbK9HNNQ+LfQVdBD0wbH/GLVKHf7sJXDoNz2Tz1jKIFKKGiLO3Le1Pf1cNWyc2TgbAc
 rEQTAe0tF3UVrQBXjU/OlP1uK5G6zxRaVGT9l51Dh9FSgvgfibeiklyu21HCmiGT4G7ZNhPj1Zx
 UqgS2drWzMUmYRwY+q3xS0uV8foZeVp/gdi9NmH2mbE5YWUNmWYFd2qbJdn/N/PZF+pUxH66Tk0
 XurucI+9KUFG/34tE4g==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acd83f8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Op5QjlldpLrGc0l9b0wA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAwNCBTYWx0ZWRfX24T6VayJF3rm
 nIYX+r+GvCGOJJN8nlDTUNrVuIQzla4ozH8OwCgx0OXtnYjJL40gHisVGPADy3QA4vK9pN+OYQp
 rVay+E7sBMhfRfvGww2C7DvfkDGdpvY=
X-Proofpoint-ORIG-GUID: Qhn1O-h2Vb07pE8s80mKFALcBNnXeAm7
X-Proofpoint-GUID: Qhn1O-h2Vb07pE8s80mKFALcBNnXeAm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_020614_491078_EB6B4737 
X-CRM114-Status: GOOD (  11.27  )
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


On Sat, 03 Oct 2026 17:20:57 +0800, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> [...]

Applied, thanks!

[1/5] wifi: ath10k: avoid IDR mutation during TX cleanup
      commit: 1c1a208e65a08191901cfded3bbccc4a54e4a75c
[2/5] wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
      commit: 3e7f5d362b2b3a21b3adb4b860aad14b69a896ad
[3/5] wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
      commit: dc29226dada34a6d19af77b4b51e90f8a3a8de34
[4/5] wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
      commit: 94c7b50351fd30e1dfe1b4051197a1445d8547e1
[5/5] wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
      commit: 4aa45334eb23d40bf31c43405daea9b73469f2a6

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


