Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DFACAC5AC
	for <ath11k@archiver.kernel.org>; Tue, 23 Sep 2025 00:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NOb1UnHXBdMvECMo2QSGZH2wkRTlB3W1x0spXCNEWg=; b=VfeG2XA6iftVJoJP4VbCAGvuJM
	8Ebe3iH8JBqBaWvcYiGE+yh5d9EffH5dFmno/YmeJonQaCUONqv9hV6w9C044sxR/06ibEyPV/iPs
	PIDXhE390fja3saahEdrWICzz0RiKS9AWT7544woLYTThYmjd9Lmez4atfAjaf52quuc2D8cOLbKs
	6mVZBzCuqpuuS6N89nqYkEUJZTo3OT3RWnM5U5bGHEGapkfsZLUVvFYDP3Ywc3OPnhw1lPwAja9Jq
	Qg8B0nje7iu5+y7woeOwAhCCIjez4Lnr2wWFDbdP75ebHogAAgXLs8gYTaI0wb07Ud+6sxGy74uY6
	DK4Bg7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rJj-0000000BwkZ-0VEg;
	Tue, 23 Sep 2025 00:55:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rJg-0000000Bwk4-2XCm
	for ath11k@lists.infradead.org;
	Tue, 23 Sep 2025 00:55:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MGOCUn012996
	for <ath11k@lists.infradead.org>; Tue, 23 Sep 2025 00:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1NOb1UnHXBdMvECMo2QSGZH2wkRTlB3W1x0spXCNEWg=; b=pZ3nCz3lXzeRJLMp
	6plYcsHUyHfYocf5enSbYSuwcmM3ReJTcpMhk8VkHtfCCPOlYBMSGmagC0QgzrBO
	p19aB+hsdHgSKb1ZpYu24dYu6xdGs2+oXpM2NhShBpKlUOeRAWSz7dytaRnoBxDl
	QCbqzl4xjqnC1oxxWRcgwj/HtcBaGWy84TXDFMXLzWib6hv4rIgWqh7ZGrqT1i9r
	9LY3i75SwnaFLS1ZpQv4PzSY0CgMhpC2TZKKltMHk5Jq2Yu4E6b4tl2JLnp+yzUf
	+Y6nr8TYN+HBZM5y/Id2eCCOUbBY4BIcaNFzNk7yV+wy5rUbYL8iqCGf5jbhRbWp
	flvabg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg36kr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 23 Sep 2025 00:55:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26e4fcc744dso23902505ad.3
        for <ath11k@lists.infradead.org>; Mon, 22 Sep 2025 17:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758588935; x=1759193735;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NOb1UnHXBdMvECMo2QSGZH2wkRTlB3W1x0spXCNEWg=;
        b=JUlDsNW6IPsZPO/UQMOlgE59UjCd1hCNK+RdWXAKxqx6q44r6fKejN4Qv50RUN3h5N
         MzdsPJVqgLoJwIYT/uXOAXyEcL1h4JZ2KRcrWad+zlyBslI25taVHPZwBpqTD+Q7CzJr
         Ly3TSQBRcgPUcXLoKkGj6PJpMTZYfTs7Aofqceg3wX85aCGRUNNnPNErd7uTcIkto5md
         m6APTLepYk8fGgyDxoiL1UiWFAXkCsrToupFQOJbxOtqdqzSFJBFTIh/BOi8SSacFJOf
         Ox5tdFvIlDRxDKVI4En5p/q0Ejx0hkgUBdxoPS2EW+0Ot5TRpDok67yJ5ckzgpIncvps
         aS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0J2TV0Z6th1/HAF/hkeQSblv41bFU0jcWmjNK/k+UzG/xNM07Xcp8wFFQcoNDa9aghDEDPv4=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywixv+GJD0UkNs0QCtjBmXOhJ7h5o/TCGtUrAHi2egBxoifAVxk
	fF3BZdxlC/YkbWmVXAa7auhiBAj+1Z1YN1AyLxspR70uX5hqxy8F16JSsuV9cHiwd7CxmyQCllS
	u48AC2UYA3zYw7udRZHmmpTyrm88U2auMraU6VikFTF24+k6KVKstfDG6ewytO9KJ
X-Gm-Gg: ASbGncu00SupAoR7g7jtbbtknq2jAwr6kxmWnlLki8ttePkP3+ukAyjpmSIrpLcUYTy
	y0Rd6qO15qVFPlsWjWiK0WjgyM9yspdK/6DcHh7UNAvlYs7RddhNNu3PU01EtqSYA894hXgMP3K
	/OZAxFpkJhke3VngeOJBErkJv9J6yJA2j1GqjG481etvvgr6vVYYi05hbSwzxRqz+8imkjAY8JH
	bYWAR5SzAR3OZZARAdjzp9XOKZOWjziJozWZdmp37odMD8k0Y3wRF60Mirz05if8xrh6leC8dQq
	+vlK3Fa0iBqbmgRLb6nvqQy4evr/uLIKqvSurBt/VhxVGIEid/ixkSm1uo8SDOmfJdLN3PKpTcw
	C
X-Received: by 2002:a17:902:d504:b0:246:de71:1839 with SMTP id d9443c01a7336-27cc696e83amr9635715ad.50.1758588935160;
        Mon, 22 Sep 2025 17:55:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgkK9eoU6vOWVlLO/FmLK8aalMDc859rdHBZhi4f6aTg1dHIeLHmkfnD2xmV3V5/OgUWynjw==
X-Received: by 2002:a17:902:d504:b0:246:de71:1839 with SMTP id d9443c01a7336-27cc696e83amr9635475ad.50.1758588934766;
        Mon, 22 Sep 2025 17:55:34 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053248sm145381435ad.15.2025.09.22.17.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:55:34 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        kbuild test robot <lkp@intel.com>, Julia Lawall <julia.lawall@lip6.fr>,
        Sven Eckelmann <sven@narfation.org>,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: kernel@collabora.com, stable@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Miles Hu <milehu@codeaurora.org>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250722053121.1145001-1-usama.anjum@collabora.com>
References: <20250722053121.1145001-1-usama.anjum@collabora.com>
Subject: Re: [PATCH v3] wifi: ath11k: HAL SRNG: don't deinitialize and
 re-initialize again
Message-Id: <175858893357.360026.14313486300585429827.b4-ty@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 17:55:33 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX4w+jCHZ8Aw/n
 ZOGonvarrmr0KXQgmeF4HCcH5haHWsWUEbHt00nxZNgO/4ZVlEUORd0SrDpsj3b5XbU/GhzSC4f
 ra6EuwsUPnpAKc2EkyX/o5q0EkDohM+SU30aoX0e8nTyK43bCAiZQN//qaIirrIoX0kh3+//BwG
 ze/Sc/OtAy9mtIGJMeSVj+TwVC+OpWqFfd6hYltHNs0Brtz/9ppbpC3rblUV84BlEVYbDZMrVk1
 vUi2sqYO4KirBYPt0Lyurfs/q/ZUIwnm3QUhajcfdQ/wZnVPvjn7be20kl2r/IPuXCCH4ud5LRV
 Q0vVdsbW53AWSKj2jXgTuih0SW1TJAPmsPXjOzzUlTMsQW1uAmFRJhUpj4/02fKEUDl2UKs8mA4
 BdRgu27N
X-Proofpoint-GUID: QUaT9o3Q8xxV73mdKN6_nt2pnMcLteMD
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68d1f008 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AgmplPYfmL6CJUdp4g8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: QUaT9o3Q8xxV73mdKN6_nt2pnMcLteMD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_175536_650200_BD1BA9C7 
X-CRM114-Status: GOOD (  10.29  )
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


On Tue, 22 Jul 2025 10:31:21 +0500, Muhammad Usama Anjum wrote:
> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
> deallocated and there is high possibility that we'll not be able to get
> the same memory allocated from dma when there is high memory pressure.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again
      commit: 32be3ca4cf78b309dfe7ba52fe2d7cc3c23c5634

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


