Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05624C98302
	for <ath11k@archiver.kernel.org>; Tue, 22 Sep 2026 11:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpELZ5f9XpMmdmJv5+YoiaMSy8WH96P37pYEqhI4u7g=; b=PbBYMPEUmBsGESuDiePA78CAxY
	mecLOHD7AH1/4pTaLxUwCwsYRLDY+tj1i/OBqzWI9hBuN3nGKAxB3N22ZE9c71BSj77hgafb7m4EO
	WZR/SkO90OvfJlQvuuTXKE80d1LGafrWgNEd3dnawIs6+kKZrTPO09xco7KysBz2OB5LskKu0GWeS
	B6TPZpxTy776/s8KGbNNJQxBpTV1x+/7KqsXtXbXf5ZMtB6GESrlu/4/YDmSuHJ+UlqVbhtaUYQFg
	GW2U+pxy1dRpKqGhANJ9f3Ms3phL4JoZ4iQ1+LWaGm1uUuMMZCKxFjuAEUN0+yLGo+VI8zfZk/lVh
	7XrJlrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yJS-000000058sJ-2Qvq;
	Tue, 22 Sep 2026 11:05:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yJQ-000000058rg-2szH
	for ath11k@bombadil.infradead.org;
	Tue, 22 Sep 2026 11:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qpELZ5f9XpMmdmJv5+YoiaMSy8WH96P37pYEqhI4u7g=; b=Iobsxk7Q0be2bJz5Lc3XFJSygp
	ae+3lAv4G5awOjg0hdO+5RrDS1xxO30uzrkX47h2DmnZfu9K9s6hLC3cmaf1Xm88I3qZ7raGgoq83
	tDbqKPxFYRTDIWnZQer89nlDd1gKKOKS/VgPu02EP9DTD1y6TSWPfDNDMKFsvBwu5LTjd90o/HJ2G
	kNe5I215xT0GeaTNSm+ObQLDs/ckinxpt3n36ntHDP3Nr+xRZdUxzehSupw0s4xZH5vjQufxmNcj5
	Qo39P2XHhsJCUV1E9bVIqb/lJvBNTRUOV8ykb44pszfslSd/1JmZI6OI9FNm0wLpeO4a5/tmmNe6R
	YOErBhwA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8yJM-0000000DTM3-2yp5
	for ath11k@lists.infradead.org;
	Tue, 22 Sep 2026 11:05:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M78XQO2165613
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 11:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpELZ5f9XpMmdmJv5+YoiaMSy8WH96P37pYEqhI4u7g=; b=V2cuTS78aB7dwG5g
	p+VNYNNaQvlPwj4nxua//Ea0uIQcnxZqPmLBnMURrWOKkXTx8flCiHbRoVe8Sz95
	EkPdKqpnsL5kgIfsMMF94wIrrqRM970pOujSHfA/JS1MmcAMGyt9SMMjpl6Yl+SH
	6zTobyTTi2m/GLo2RMPR+n7gQYktokuHhcFfKIJzrUyjosZ4AYlpy8wS1lsda7U6
	rZ3p5clKxIR2ryc0CsvQBxfjrefxcU3xpF19G9d45Uc+lwgVQl0uTrlyx0rIUfKS
	c/tmdZjNm5/UIK/DE/P/JSgZLHp8hBpLEkuWnpfRv5KU2e9A3mWdanMtx9ywwD7E
	saWuVw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeun44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 11:05:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc92350888so71975645ad.3
        for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 04:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790075116; x=1790679916; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpELZ5f9XpMmdmJv5+YoiaMSy8WH96P37pYEqhI4u7g=;
        b=WHh8clzFjxSW4qdnMI8jp/XYjjHlf+9Dj0XBWJHMkJUYIkjw1Rn3lPIMHMDL4rfSRj
         ZcKPMYtUG+S0IZfMN1wpQKsr5EEWrZ/o2oWY31jznw5AF2CPF8mHrMvZafupAFV+/RmK
         /ZkHG/SpRKg4kfIwlyfQ+BU4rGtirxVLetpc5Qfj4kZGX/D2X5IlsX5Soq3eLakBYmgA
         U9xNnKyIdfvzlIrJ2tj8MemaquKH1ebdGtL2f/qZPWuWkkoUBMmD2I0PvSBIi2DfkZe+
         kf5touurIEtJaiCYEYiriR7Q6n+ryblx82ucQXpWqXTcQT9b+CcvQEnaFCd7lOeX87On
         Gj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075116; x=1790679916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpELZ5f9XpMmdmJv5+YoiaMSy8WH96P37pYEqhI4u7g=;
        b=YiZuZVRdcdVa6wgFCKTwuR/cRrCWBt88KipiYhCQyFMhhUVRIZl5gfiVYd3XVupznE
         A1zpyrS/4YJFrXeWN43BSNaoCsxHDNfT5yb91zFqCGyvm0ATxCAMF+Cf8wS+WROv0g4H
         4JSakx69oyH5ek3wXfxqxE/XQZH+Dlmks8sujMsGo8vNe+tGnxFG/MQ9t6o1Hp0n8oV1
         rB7fj8scZQaBy4ffPHKgAULd5/n/EciAnb+jfTZNqioJGE6iRYPub9rwsDDJuE5uDfGv
         84J4fZCUOfo+o0dbTXyiutfFbbgdHQaudWQZVkPxXYjlkgxQgZMy9Kkh5xISLbgtr0yj
         d/9g==
X-Forwarded-Encrypted: i=1; AKwUvBzU/9iTJowOYu9T/adL/NQe/UHc8byR01o1f2Nm34CE7aWLkrb0XwXYheLlJ+x5YDJPdmA/78c=@lists.infradead.org
X-Gm-Message-State: AFuF++lK1lpRc0D+AmYxnpW2B5N0r9rMXgq4kVffNcUDGEak3sD9SX40
	ESyR/QHMKjeOa5a613UJzk78AHZQkTX5nExIOaTLEUMsZoGNU/aTu6FsehQjRwJur9PHSJu2UC9
	1so32IRVkB4dH4lpSTPd7m0oVVE6ux5LvvEVGi0Og1vJpcCdFggXheWNNKPCEyhML
X-Gm-Gg: AYBFou2u55slLS2HwBkHipufDPhup2Dz0c+ydJodR2/AnAsgoBN6SkE1D6KssBKSQ+I
	cefosOji0iKf8xGB3E/n0VkFZZOROMWbqLlDAOKL6lbsCmaC7rvwsT46Qd7xMPA/mj7jnuAWJ1O
	qf9SFCPS8WYVDCXP2NxfkH7CSPJ/tkMLa+3dAmkkANVrgwAfuybqkPFS3ogm3xGp7R1ZD6D0t/a
	KjVa7vzgXa79aHuLlpdgTOk/dayQn8owxquUgQqO3TNtMuKqoJckVAYO+SBc2EW0ACZ35fVOHRE
	v7B6OwW52snYn/5NGNBIrHcUVnZZV3qgsjit357DD3xogmDZYMM65eQja77V1MpAcA6uoXN63AI
	L0+mnlAqsKH9ylA4NzpfmuN6jPu4EZi1Yl6xiNXHXmDFOY4w=
X-Received: by 2002:a17:903:24e:b0:2d9:2fc9:5706 with SMTP id d9443c01a7336-2df609b0c4cmr8782125ad.2.1790075116010;
        Tue, 22 Sep 2026 04:05:16 -0700 (PDT)
X-Received: by 2002:a17:903:24e:b0:2d9:2fc9:5706 with SMTP id d9443c01a7336-2df609b0c4cmr8781755ad.2.1790075115554;
        Tue, 22 Sep 2026 04:05:15 -0700 (PDT)
Received: from [10.152.209.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61340e56sm6822733eec.30.2026.09.22.04.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:05:14 -0700 (PDT)
Message-ID: <c802e9aa-6261-4dd6-8229-8c9862965d87@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:35:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] wifi: ath12k: Connect to the QMI server belonging
 to the device owned by this driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-4-27dd80d841a0@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-4-27dd80d841a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yLi-wglzDnaspyeNxgdUx-gkiqDROK7Y
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab260ec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=R4z_reooDQMcG2LTbH8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: yLi-wglzDnaspyeNxgdUx-gkiqDROK7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE2MCBTYWx0ZWRfXxdfcRj5HIFzp
 +4yijFyj6Gco+yAtQjpo+JsCHjqszKWD0QMXAfVIdNntxD7a2o8A3z+YAkd38a5MS8Yr9mm+mkd
 GelbLcJZunPWCshxqJRj6gjV0TZUrSa19JkhuyeyCo6Y+rvHbW24R/YmHyrQcbbcdJDUo61yJ9O
 nv4+UDkoET2X/qy4X0aGusuEET/MgONIkaKKh2WVL1gQupU04Tq3cE450rs7XWoqNQbV1J6qpJi
 J5FH1jW1bqcFjTAg5A4fw6s8m7BAJ75rFVvvpv6/GIAqVW8Ro75/oqPom/zNQjVwEf5DXFmP5xG
 hubVAJ2unWeIV8UdKtIP+Zz49Vd0/3RwUHsLCZROA3t+XN3VQ/s2wgkdp1GdIlRkgDp9hFv3zMF
 6VAc9PM8S/uLY/7nKMd8BPQ5S4bc/SyR/YlMcQ0jlWrsVwhQdtNdx7fTvXhQ2iewXgemGdF1jvO
 rAnPE2hIxPTtFCoEICA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE2MCBTYWx0ZWRfXzSlQrg2zGzcd
 hOg6U8BESxFcwhDHpP3x3AH0JCGXy3opGufZLgfEcF+/WlGQ6sybNxM3+motnpS/gbgMLu4SSrN
 ujGGCOYO7+b7k58EV0k5Nj/9fPH2moQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_120521_405136_7642D5EC 
X-CRM114-Status: GOOD (  15.33  )
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



On 9/21/2026 4:53 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath12k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


