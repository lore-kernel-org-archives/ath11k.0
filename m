Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99F7C4451B
	for <ath11k@archiver.kernel.org>; Fri, 17 Jul 2026 15:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AojuRYk6z30fX39EjxdpLOAOLbMBF9jrafkQwbpO4M=; b=cIeZ3QlZHUjW/CGmkdOgbBzcwf
	nMiG0VfxUgZQuMhQ/6wRiD5+Dr8ioeiblErRchYzRYAgtDFP1xhKpZheEqrINMYC2yZEXD7Sij0BX
	+jtdn9NnMDMZHixq85X19sNBdmRHQ2ZpeAwVX5W3rETGUXJ6+Kmm/BzCgVgD88WjWvpR6Qu0E4HFQ
	DDRwE5wg1P9dfGMlQBZd0Hpp18BvnrOJNnM8SWC0ZawlPAKZRWbtJ81rwz2ovCFFI38M0fu40oTFj
	mHkFM0eELNBvvZGuZUVAJYIUl5biiivr9ixFT8tf4BdiaihZRQrfk2eypmNO9kEa3bZDPVkcM+7kO
	wxceYKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8h-00000002YTI-1lO5;
	Fri, 17 Jul 2026 15:06:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8e-00000002YRB-31OM
	for ath11k@lists.infradead.org;
	Fri, 17 Jul 2026 15:06:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7oa82187190
	for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7AojuRYk6z30fX39EjxdpLOAOLbMBF9jrafkQwbpO4M=; b=kis/fnUUcMagspDg
	sP6BubVQk8G+gvPHCqoAj/D7TlhpGedyYdNm+6z5AT28h4z02ASl5WYD+dVHeV8o
	6CxaHPkwmqbLSs1CM3wP8nkZMQkRlHbicZGa702e0jVK/BqVWYgBR1MktmA55fmU
	/+L+6/QwhxDeG/BCrLxNDfu0cEJn54PUf2+7pm/ExqtSdJAcaZz0P/VuvLlQ/cMI
	r40qnPQiqqdsIMwWRhMqOTU1j79zGUOStoHLNJPzVF6t1/ocK6mW5e9fY5TEaJ18
	gLLPlsptRFs4kpYF/PPpd5TCJYCU5Nwjb/Ap9NB2G9COevysLYiEuYsTX6DJ2BvT
	WFZ+8A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3atd2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f385887bso186819325ad.0
        for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784300767; x=1784905567; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AojuRYk6z30fX39EjxdpLOAOLbMBF9jrafkQwbpO4M=;
        b=Z1OjXjysvco9unwv1GZtWoHkR1nlmaoGMuRUS7HMSiJqQa5uByvfpN9JBSNa/Bf6+z
         8XBn43ebMG57/RIMPpW/xgvktTzK6/ew+/AHLTO44DI+patIdiphSNumrWuQjG8vZF9k
         P83+qJHUdMk2y7zCkwwcLYr8GZ9c+tzKh7JG8Ihj8rIbwtOtG8zqq453I9Wig3I6sYRH
         UMg+6/Ju1W0hWAeihDOjCIGlxrSNhTH1DemUnLjtCU1hj6UCY45xGiGMqV/D1VMhqILb
         77sOePfkS5BpIi7KVSLfjm8cx87TJihVf0ZiIbZIp/RseD0cg7kLHQmVa4zWUHzS0bFI
         Rqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300767; x=1784905567;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AojuRYk6z30fX39EjxdpLOAOLbMBF9jrafkQwbpO4M=;
        b=Q9z0uZxd8hQACkDANr83W7GZFEnK+aZSEaVrfkhBqYKBqWuw5qqlp5eTFkwNjrF9GX
         nDRwvI6bauzVUytHqJFk6Af/pPtiLw8cvogZd+oy5V6v+ji+aTQtQCp6JXlx/TBHOkMx
         hTxnUGNetWLnt/rObTgsHcDvY4CTgPTq2hBkKLDu2BRFJvt++OG793QlCW1U6qSMO29v
         GN82459Hpc3YKWEYGOoU9f8LH55YgecTIDWf2hu0z6w1+YxYdTAhJ/STa1DyJT9n6n4H
         WiRl4diRYMTRSdeg+cIdAHOTbiPeeL2izJhLKnqvdOUQuz+KRc4XrF25zrAuLFLYxro+
         YUsg==
X-Forwarded-Encrypted: i=1; AHgh+RogASLLhqH2f/rZldNjYNZW7/4NhKUN3brRdaozluCQamfpEY4ZVch8xfsVTByNJX6ow0Xxdbo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBss82JaQLtE8I3XiIgYspGMWCbAJVgP2N+3XNUNs8nfrXGFkm
	fre9qbKh5WD9iIn24OTpnbJ31dHQ4wi63XVlzTcUkrnqRwHi6avZBz+N/l0yXH7Q4fmPb0q5jN9
	Mh5JL8OIkny+S81W4tDXfvq/0FMYkoAl/+2+65nk0RaMTib+uPV3edeNP7ttaEgLMX2VNLG0J
X-Gm-Gg: AfdE7cnLkH/aUN1AmN8CI8eO2DP7IkFFaY1bmzn04BzhEechk2yo6WWa8L6hXNt6Luj
	krqYacM8hYhexIEohoX5XP7zrO/BRUBrtCUX7M80byOFvJF+UR8naE3LQX8puxlCAsu0aEvPV1K
	YlZkbBg3g1DHnI893v0WzrRPCTEhuKkfXpBclMRccuTXNZEwNxVIA4YIoCLQzOPPvfz1GVcfIN7
	H4G09iFKPSKUxWBiEF3czgQLOy6LT/pruYnvidZYA3UzV5cWQNbyy4dTDYHgjUUOIaNKvnnO7jU
	8wq9XJ2dcPJmD8FVzQnwv60+lCdREF+36Yl9TNpVkVkAshLTZrxO7eIazRJdPqH5+cc90BggAUV
	mToJO7owh27X9Z06SIeevcmJTY66y9Mbo/lyA0nRT6c8YLUtJM1gFV6I=
X-Received: by 2002:a17:90b:3f85:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38e4b479ecfmr3042963a91.19.1784300767301;
        Fri, 17 Jul 2026 08:06:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38e4b479ecfmr3042899a91.19.1784300766645;
        Fri, 17 Jul 2026 08:06:06 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm15681190eec.21.2026.07.17.08.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:06:05 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
References: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath: Correctly copy the hint BSSID
 in WMI scan request
Message-Id: <178430076545.128359.8126500058186814616.b4-ty@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 08:06:05 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX/iuRykHWD8PO
 /sPD2gdWE2qbqkLge/mvFshhhnTxCEeA5pgu1TBoryg/7Fd62JSxfyiV3mZJFYyCg7ULzXbAjsv
 iM+qrBliEripSRALX8ZsKMqT/p0rBA0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX6EmbzbAmKwSr
 f3/CmkHUVLObs/AmKMFwpsWh3+Zd+8EiQvVipaE1RmScnMEsGjWbGh2YJP2eIvjC5MsIp8xuFwW
 ORsOjgUrPaYWwXL5/nR5rbzR+WQAs4ZTh6hdjO+vqgwW9Anggf4CWSt1+upit7tuY+ZyxC78Gma
 +N/5QKEjIIlwZLCY3H37vZucnx1SVa2zeo47tnjVofz/uvtDmX8AfiAYQLN/dFGHX6kPsCmlOVc
 lwqTt3qThDR5L04d3c5vr1BM1fopRlUOH47Sq+36vjHFZMnF3H3Z5XdSZWrEs1JCvmQK8LHxDvZ
 /6yIzkktr28tthSJ1sSPc1Dg3lQVJ5vd+pAqn2eDDoyM4cU58kSXeJddRHbNhtaMT691IVo3EzI
 sJ6ep89/uNTHN/NoMWxpwAegXZnFVHkMTEoMGejOOMxJZ2m9NdpJMoSMD0X6HwZtXtZ30C9EymS
 O0g+0f+cgThno688dJQ==
X-Proofpoint-GUID: 4DFmqGT5Qj24uppKthEZjcV-AIi77cU5
X-Proofpoint-ORIG-GUID: 4DFmqGT5Qj24uppKthEZjcV-AIi77cU5
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a5a44e0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IvR6sJYjICgyGHFFWMEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_080608_754526_C4986BBD 
X-CRM114-Status: UNSURE (   6.54  )
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


On Mon, 13 Jul 2026 09:15:48 -0700, Jeff Johnson wrote:
> Issue was reported in ath12k, but exists in ath11k as well.
> 

Applied, thanks!

[1/2] wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
      commit: b127f79a49335679d117406257cedab4fc20596a
[2/2] wifi: ath11k: Correctly copy the hint BSSID in WMI scan request
      commit: 0db9d58c8757d0be5ed546109e37bcb10f6c1fb6

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


