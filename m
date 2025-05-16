Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E9CC3ABD8
	for <ath11k@archiver.kernel.org>; Fri, 16 May 2025 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rKtKvHPlmBU35ct81LUYhk/RNfjmHT02ibJBXpyRmo=; b=gFZR5YCWfWIDX8wxUiWqmSp4Pz
	FOHKuxghdJGobcO0vK0T8jvmjJ9pYUQGb6Zf6Kz7/VcWQQ60BYXxcvGFbxpSeXZ8yBKiSKoV18xw+
	Ij0R+F/v0wDDm3H20WE1HsKneDJ0j1whAI4uC8E+FKzgXUgcWP3dslsWWWlCaFDtCXI2dUG4Y82mB
	bFc1JHXY4VJ8pnhsgVZ3GU+Hp2a0R93jIZ6Ni+9liEXi9MTN2iHkFWB64YhsMcbLLslNV++hGB1wK
	K1NYUqqbYAjG9w52krI/SiX0u/gs23h8LMvTF51STl6c2tMbTgDaZRYBYIJEDVIxr3fALrwjvAxO3
	cN5x6/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG01u-00000004MLJ-0AqY;
	Fri, 16 May 2025 18:43:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzsh-00000004KuK-3WXF
	for ath11k@lists.infradead.org;
	Fri, 16 May 2025 18:34:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBunYM026134
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 18:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9rKtKvHPlmBU35ct81LUYhk/RNfjmHT02ibJBXpyRmo=; b=Rm+x2PtkHYgN4Zf3
	vCRjB3HJ3x1aIuRWsvQ0kg/6YwMm63VMIf633xxpcnmK2Ehzt8vsMX1nQs0h6PZl
	Ht6cFjZvZOgONWb0KjWXpLigySFecrxTTB4So6g6grYSdA707SOQK3rqXZY9+2cT
	Ub6lm5gfazWKIZiRha+5cajGEpPhBoSyIlD0joEW9BHLeImcQ3jFy648Bz6lxeov
	f64BEm52jB9hSDNI+Hh/yhtbiF+lScLQPmRBgyGRdWU2rhG0sUeRrPyHT3nUeUJa
	w28eZcfQ7RNA4vY/KHDTq9QAIQ0dpTMj+0dk8Z50DN6TS8Uvku/ddh6oCUrig7Py
	IrXxlQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyu3m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 18:34:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30a29af28d1so2031456a91.0
        for <ath11k@lists.infradead.org>; Fri, 16 May 2025 11:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747420442; x=1748025242;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rKtKvHPlmBU35ct81LUYhk/RNfjmHT02ibJBXpyRmo=;
        b=J02nvSM/kVo8RI8oTbvmbcNdmbGnrsvUwbuhgJF7cyYFsoiVUoTBBrtElX+3TIP+Ov
         e/Fe6RzwQOCucVdRKo+0RZcgxX+jqW4BU9AZqL6tQzKu4vyQOn0k1JO1/LQsM446cosr
         ZQWsIh3gNaSqi6LfBWiipVVuO/WOSKTzU4m9vz/KIDipkv6YRzjpTguIADfsKdY2Cjos
         6ghaEf6V0J/kvz6zfmkk2BW/OMMCDMcaVbZUd54Jc6RaSlu3IOFVALvaA/+wIS2ii/nP
         kf97xqg4v1KfxiEKer88bsPsyVzAprKA2Mi03x6H8xeEz0HA+G4BtVMQH98QJ64MyeQf
         bcGw==
X-Forwarded-Encrypted: i=1; AJvYcCWCuDJd5WMuFEPXQgLPAlC4hfrD7znYQ0ZJ6CaWP2Iyo2DQTL9MjGoSeIhuEXUDQy0x3CT+37w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQfQZsJG8eM6FF06Ms2Kg1uoedV1mq22u0Ap5seX9wLS+3IIJ5
	z+LydRF7b6+KfyPaYYGEEyubmrWNgr5nGB0HwD14pLnEF632aehpPtRPUKiZVsEZ6eMwy49ndMI
	uaqt+HjTa225AAcS77AXPi7Kt1HKJVYzD1fbHIbyR+fANWmgfIO5z/e0YuRPiDb0ax+cTXe8L
X-Gm-Gg: ASbGncvgnn36BqdbHttTJ7NU2terrO35M/2Qkmq7SQZVG7z6o8FQV1dAnI11Drmyym0
	wEJ7u9ySsVv1gG5rYuq6K50K7KzDzW4Jp+igtlZ7aFWZ/TnXGfQ8ZGWAzswbZZiHcsuiIYpADuz
	tdHIsLxETJ1NjecePLWo6k/HfPyzE2NF1Os6RlAi3M2PH9R+CSAzfnPHT3oAoEtsHYGlOLzGXHO
	v6SjmycHvfwvlR+fEite4MEZ2XKJCRl8EylYq07k2ltSLTzP0Hl8qRp5RbOMRSyUOpHmC8x1Mbb
	gkGzhpqCN5y4y1WssdGICDkzgRsvktTM0ue4GJ7ZMsEVaKfa
X-Received: by 2002:a17:90b:55c3:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-30e7d548c5amr6293554a91.20.1747420442432;
        Fri, 16 May 2025 11:34:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfU/I+VS8P3Y2hHITlYwiE14XuPxHWro93S4ypSGLKOx03F5dtPTXcGPNIj8o550YK/qnMUA==
X-Received: by 2002:a17:90b:55c3:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-30e7d548c5amr6293513a91.20.1747420442026;
        Fri, 16 May 2025 11:34:02 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d576babsm1886299a91.33.2025.05.16.11.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 11:34:01 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>,
        Clayton Craft <clayton@craftyguy.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
In-Reply-To: <20250321094916.19098-1-johan+linaro@kernel.org>
References: <20250321094916.19098-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix ring-buffer corruption
Message-Id: <174742044076.3092151.12237526642580787341.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:34:00 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: bAix9iAKByUkEvbOq9rgVCj-JMCH3DVO
X-Proofpoint-ORIG-GUID: bAix9iAKByUkEvbOq9rgVCj-JMCH3DVO
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6827851b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=9x3tSbx4FoV4MKPCUlEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4MiBTYWx0ZWRfX/h6SMJEaveiv
 RVbCgOxmPnwI2y1RBt3n6kL5NII44qBFdaNkJ54Z/xlYq1Hw51+MA/5HSNvp3erneL2C5EZlmbN
 GunfnbbGApEYEWTs2PF75zRL1KL+x3gsVVmR2MbcMJAIVGIvo8EpZ5tkuhELTYAi8ugniB08hTc
 aZLTvvH8kT2tSjYBdVRmC/Cz+GAOYENGEc5Zm9XnKLmVGjcd6uw4jZnoZnrqnbadNUM78s/Z3BD
 QztF/rfj1O68DluiMy/5cyzaWE7VV2x1+u9Cex9vT57q431kcTxBmxcFr1a1J2AAVqLlcrEvHzb
 ZtguOhbzv0Z+uLkEVyccuEv+JAuZY5FSVfNCRbwnVaVAMzLmRBFKfXHpL18B1/67GbG0sqjGkxG
 FAuq9UEu+lTjaiWOvlf39EKAawPMI5Ja7b4gzDlCPbSno7jfgSy5xkYIYR0ERn/4Jc8pZGda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=740 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_113403_884991_ACD6AC87 
X-CRM114-Status: UNSURE (   8.86  )
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


On Fri, 21 Mar 2025 10:49:16 +0100, Johan Hovold wrote:
> Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
> breaks and the log fills up with errors like:
> 
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> 
> which based on a quick look at the driver seemed to indicate some kind
> of ring-buffer corruption.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix ring-buffer corruption
      commit: 6d037a372f817e9fcb56482f37917545596bd776

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


