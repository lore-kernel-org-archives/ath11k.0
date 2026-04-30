Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A950DCCFA13
	for <ath11k@archiver.kernel.org>; Thu, 30 Apr 2026 21:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=; b=nHvHHwUdeZLX+jNIBOSTdHwUOT
	1ZfdY2bgbYl5DfAjoNRluP/fEt747HaVYyXQ7HYcTsCRiWeLq6RfZXtsnXRx6xljeVU0OdlFMxRAG
	S+pgHxMe3wV/sAc+96rhuYR6Xs5lJ7bsrtomouqUoSxpnkUtNUsYV8ywOcjpa+0ZGe71bokjWEBIj
	sDDIuQ28dbackpmLEWyN6cHI7VBGunuop1DRjUkpOQNG9odOKZ0FEwh08GlrvAYkaRCQJY6KdVa0R
	Yts8a3lTk3Xd7OBQ3o3PIcgimzin1rwYo0iqjI0KShSE8S4WOBQtk6vgr687vAZbLmBjuUJo5C/gW
	idBkVQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyB-00000005z2e-2KAe;
	Thu, 30 Apr 2026 21:30:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYy8-00000005z1N-2b8K
	for ath11k@lists.infradead.org;
	Thu, 30 Apr 2026 21:30:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UKIF8q1854194
	for <ath11k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=; b=KpcxtflHF1RvLzrm
	x/LpGvQMk5ePecYf541+Lp8GKCTwzWCI3tUaQt31d9/jT861bvBMMi9HGjm5xmoM
	KgIHSG2oqN7Pijvoi2gJCb+peObcavyoRWp2CndyK0uaAYwpNhtOlkjHxFAejEht
	8NK9E/6u2huWO/mo9rv144LFxvyF2M1GpNkhTRvAW1ou6aVLfr2qI5BNc/pdrlFs
	A/TeGctbIaGdNHLBzLb6Fz7sgiQtWqLhS4wsfBB0z7nafe2Iut60Xqaue90XJ7PU
	e2YlB0Y0ESBmg6jXoRvHEfU41E+JJJneP7mdyG2n8GynP9Q1HW05kXmKDl5d6zKI
	0foBKw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dve0g07me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so2033323eec.1
        for <ath11k@lists.infradead.org>; Thu, 30 Apr 2026 14:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584647; x=1778189447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=hzjgLmbxhuI3H9smEU8U9OB+cW3K3tZ1SC1L9oO2yRGNsy1ZZjxE5c98n7dYU2jmqK
         9Nv3YWo262omjfpGV9kGg3itqZFJjfMnclImdkj45SQs+yjKCVoMlyF+n8QR7uLu4GXB
         kbId9vbHkDzDlcq9FNs0jyrf0FzzgCSa7gjDnIdnS6rnKHo3oFiqK/BJzWZuHYhfZ91I
         wilsd0vhkoMd6RY9FnGRy1uu/NFUd2AIDXcseJubtqRzL7mS5+bIGXJ/5trMCPv5ha6v
         dT5h1WhXw/weIbZri4AonphPtEXzhlJn5FEEldfPSM66kt83Dfr4X5S/AUUHGrAMKklm
         nPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584647; x=1778189447;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=TW3BQnTKASaD+d4e7bVNj2ZMWiuhWYN8hvMhEpr+9QcuBNxRIWW1Wme95yLt7tOrPY
         4YciFBLcxjksI5dZVqc2DiJ5iha+JWxaBHh4nEl1tGiajvt3Mv+FF3QGycQsaiFKSVOK
         1Wcl+ikuJkrYqPppvfb568dkxUbBcp2Vos4CgI5aka/3GnTOl18eH64eDYN9P1hX5+ey
         84zyvxXCu2NZXCnP2/hiD8+sk6FC+13tQWT4FH1FUCM0X228eQbeelPB+Gs0HqZchvya
         Uyp72JTA9d2m7FZbBD56Y6nj6gMurszLZJ67+1iIWiETbwpzblv4OR6bkrjNxWoDewgT
         pzPA==
X-Forwarded-Encrypted: i=1; AFNElJ9vst4rIDSYWXBuepaZNXo1pMLGVZ7EyTiNl8sxBe5kxBkg0MY+vztqZmYwBjsFFqEBWEOqyuE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4/C6vM68XP9FnEYuO2xHP2otYH8cbfdX/4yZbYVSjqHEFwFfj
	e87V/3z8e7wCNT6UY5m/9WzwA3HiXf1NfrjHobVzEcHko1d+QyJyXrC8/NRrB6tfLIRdHM9I4Vm
	19bRDZNeopeRr/owwiz2IudlaZMiKTbNJNDPj5xeYWkVaaIrUgMyv4jNEreRez7bX
X-Gm-Gg: AeBDietl0+1T6D21J15OVNozkONcLMA4VUEzriXwcRDhDFkkASOuSCIZnjcxc5SRwGs
	fBwnDeB8TurQqpwDAzheX8xB2gOpMOO12LWmokPXXABNtpxgFz9mWdM51RXlmj5PTz1r5EyWfOd
	Tzs7ifd+2HRwzO3tTrHOEPZ9jGMXYa7UMTx+qcnvTGXsL606RwtBHVyMEYN6a+LVkPBTARu+bVw
	YYtui3Gz5bbpdMThVaHkDY4KLrKsRxL+ooXAG2yBDiP2wgROh3INmBOCMh4mXi5TwHwFXmiPte1
	uE5+ENghesScYKHtll+lli3gjfn+yzeMwojbAbr/7W5jLbeVMuvWZOClcP2/soIhdGKiRa0P82e
	Yjfic117BZzNcUMK81LroPbVyaRi/ge6rwsOoL9F9VzZeO6HBMgqnwoHprzJNEObb4BFPtOIC2j
	cUySfWt1lzI80=
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181031eec.8.1777584647388;
        Thu, 30 Apr 2026 14:30:47 -0700 (PDT)
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181009eec.8.1777584646856;
        Thu, 30 Apr 2026 14:30:46 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] Use the QMI service IDs from the QMI
 header
Message-Id: <177758464538.1848985.4937106435944960092.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:45 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69f3ca08 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pNJNIoqo8oUBudG6fy8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: c_nhLy0Fd8QjAsxYlCWFwcDrrIbeRbsK
X-Proofpoint-ORIG-GUID: c_nhLy0Fd8QjAsxYlCWFwcDrrIbeRbsK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfX9dfx6G21vmrX
 vUvvVcii0cf/cGRCUBJ2ScQwJi9KZ0xfoxAv15Vn79YD3yZ4RMXWxr4AVAfpK9GUPvcOP4+06mb
 bVx8uvRdivRluJk1lv+twpnY+y5dK7Vp22dJjwIC/5jqPJsQpqa/0soo10xidFTADjN8XfWaB0P
 zXrX5Oy7RsMhYt5XM0JHNk77qHEVcIyUHfKQ7yQWFTXQbrmlNxzDpQentiZp//s48R9UeJRRjp+
 qkytgLWLOaAhKQbmnRQbXpfXssk/fUTMZHaXk2XU7efxwkdyX71vh/XKYJbOXMxyiOKBqmdFtLH
 ytJyBnrzUtjEh8YBqTGzeTLwDffvZ7siUtGVsE87dxcerNDTVGCKGh7UIfvJU7flZZKwITDaVgD
 Ne1Ma0Wkz1YUsN27HeoadRciqygqF4Xe55Ho1635Vh9W74rNCUQlSBSTQDknZ5IIYI7KVHZR2R+
 fmZ/b/lnrHzkyOqI68Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_143048_665159_5651FF00 
X-CRM114-Status: GOOD (  13.88  )
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


On Mon, 16 Mar 2026 18:14:10 +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> The QMI service IDs are defined in the qmi.h header file. Use those
> instead of defining the IDs in the protocol implementation file. It
> will result in unifying and providing a consistent way to represent
> the supported protocols.
> 
> [...]

Applied, thanks!

[2/4] wifi: ath: Use the unified QMI service ID instead of defining it locally
      commit: 0e39eea57626e545c596734c0d250c1735f1a7e5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


