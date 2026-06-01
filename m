Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C80ACD6E5D
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6LmX3hptZ7zNGS/gjK8s/rM2al2ZqDKDWoSUmU/Yp8=; b=dVF4r53ilU+Q4oVQgJP+sfykB3
	TwXDRsPv2BxLcdU+jWeR3bNxiXs0yc0R+Gvj379jLJioEyVkPOKP+asajPqXxT1ASg87yk+G4Yu0i
	JSeR3QAa/+rZrr3Qxd8FbpveqN0H4vtYxcs5lUUjbfKDOspLWCd9PPMC10F21/AZBz3bwSFe5sK2S
	ee1H8WILE6rBcspUkmgtinOND0P6nEhFiNHB4KuA1V1V7Odf01ulQLT0XuJRL+jZE+k0B6vVO0/kp
	wZiqZDyfI/J15fXyx2B+5F3+ragLzUbM+N4ZcUzvtQ/EzZ39jw7ciWaqiJWzCFglh4JKPE2evhWnu
	545nIjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60A-0000000BWv7-1z6l;
	Mon, 01 Jun 2026 17:00:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU608-0000000BWue-1QEH
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 17:00:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651F4cMI145078
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 17:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w6LmX3hptZ7zNGS/gjK8s/rM2al2ZqDKDWoSUmU/Yp8=; b=AWtWvl1usKP0x4wS
	utWaKnaO1RnyBVYvxu4c7z/r4BRXoQbgmGKGeYtXnWpxg5hR9p0uvqqOPQWx5UXS
	a/oMkEkEjdFC4PnP00rI96MTWNKrRU+F7N+ugV1A/o5ZbxqCz97kPhqbwZgfmMJt
	3I5hAl3wrh1E7TYAR2+vCPPSr/DEL68Oo2ewH/popD14OcASzZ8doSoluJMqT/Wg
	cpU2a2aMVyVzOC/ZlFSTkRn4SRsxfca/SvqDZlc4ZS9CLVbVsGHhmX8WXJWuPQEc
	EW+b5SxUPB94ICySr+bKPjpwU2gXDID9AV3YS4wwerMSTo46KntEcBnS7jUzDiKA
	k+DF8Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6stt1e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 17:00:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137dbe27199so1969537c88.1
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780333231; x=1780938031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6LmX3hptZ7zNGS/gjK8s/rM2al2ZqDKDWoSUmU/Yp8=;
        b=AZGJ9xgFmFhbENMdhu9GeNnSojwe7GJ5DjuUHtEOIe0uBa0WEVOdamVU5wIg03b0Ss
         Q9mBB3pI1hYqPVzoVrR0YFksEFawBc3dEOcbfuwCfK+AVYeKYcWCdMDvDWkukZtf+IUZ
         dm6eJ0V9t8skzbCvlQSATlmlrIqzyitD7fWsKfGrF9GKVhGAD3yBcirr104pJlVtDIfw
         6h4njtXduRRudBQ+guowQ06TpruborYV31sU8b/67zqpKEAGTnUBdEMpZ7pOnNPFzEHb
         0xkzJmUwxltTIxjW+8sA2z/NYJ0/F1FPwGxrEkfxmJEFi1gnt4z7e4gICs9sQJWIKHAA
         kpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333231; x=1780938031;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w6LmX3hptZ7zNGS/gjK8s/rM2al2ZqDKDWoSUmU/Yp8=;
        b=VYZxg3PeV0g7+ty7HXFS3hSQ/SuvlhVadkz8RENzAI4kZnGpwL6ZE9M1utJf+CQ6qM
         WZ62QGtuVNKWXKEfVfPau0ICI1091ukBpGCxQKA1QnqoC1mIBNWndV/tk1kMKNUbA0qm
         5vvOaKY0UMA/NBH81yQAeCZz2LT6r8d36QJ2F7VkNvxDJuvkrmxsbHnIiWyhPkFk9SF5
         mkYxlBQOsJ+dATeervm8wZXB0QmtxpPvrXlNF1f0umgbgUtbKS1qEknOdHjpc9sM/6CA
         nsHdBffk/DoniHkAL2HNEZG/RXwg4p5R8KaG7/2UpbnJ0dx7NVMSgr2m3ptXFwnaArb+
         dVUA==
X-Gm-Message-State: AOJu0YxPFJzHHZ6PUNVw5tT/M1sCijFHxoYX2rJJ7uviFPznOADbiIbo
	7eUq39ptNxB4ZtZ2klRtUBla/ZLHQ0Dp5hgjH8UXOrVMnU2Jc0QswcQA0OVAL1GL0AkV0FliGXM
	6+jKLHS0DLYhvG0BWpKF3pWc0l77fsDUI1saokQ2MfjqhU8z6iduZITwps3ZqQdeR
X-Gm-Gg: Acq92OEZjKD7ptLNmuhjsd/KdqJju1swWoYVg9WHRalKugMKCRxnrXLVgxPzE2nUvrO
	rj6eXQIlh7Rk5XFI6CnWFAbL2cMPIhhwW7Ik0uk+wsSG3kRO7P2PLlRvRmPcLOCIXBkN7Z2wlVr
	j6GY6QJS5GziqtFQakmcE0YEGtBzvXCTzJlmpM9CUUmMJBzF+B+HYWRUK0OPUqor5a73E5AUSde
	eUX3ZHxFb6ht4QCURBQ311ZjYv2NPFAOOugK0+8mb2ANL1DojQd90OHMo214o4RiMt/8VDvi8vA
	dfdhYlwdMuqLLyRpexbCysfT3ztTNsOU4favDi3rRasylj9P1Xjvd0zY8fVd/8FDSbp4ZjmP3mp
	YT8+hCU4ddggifQc28hl9Qn1pedb4ZFWD36XBw+t/vyACRg2VCzDxjugesDEjh0YRPMUTcziSTc
	RLkscoQ7AXkYA=
X-Received: by 2002:a05:7022:6ba6:b0:136:ac69:b0e8 with SMTP id a92af1059eb24-137d4143502mr5204497c88.15.1780333230908;
        Mon, 01 Jun 2026 10:00:30 -0700 (PDT)
X-Received: by 2002:a05:7022:6ba6:b0:136:ac69:b0e8 with SMTP id a92af1059eb24-137d4143502mr5204470c88.15.1780333230164;
        Mon, 01 Jun 2026 10:00:30 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bdfsm7151625c88.9.2026.06.01.10.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:00:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
References: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k: dp rx sanity checks for
 invalid length in error paths
Message-Id: <178033322952.2045173.3876404183011075387.b4-ty@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 10:00:29 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2OCBTYWx0ZWRfXwsnXL8+DekFJ
 Q1Q6YNt2N8Gv2dCuB2rsjNCwoRYUbTGDY2XbO/PRZeFiL4+66bcV1Cr5IckXli1zGDiiHKoHlnz
 ZM95j37naDAHAYRQAs0aT6gJ6BRpA//iCCrYypJ4hRaWyB0ATcOhEPd/T/iNjw7fznwGML2DHKQ
 /iW3NmtW3waueEb8kL5y/aqySMawFF+uOYa0iGrqFiGxqDQPdm+Lij19ciqFBuHnvUyJMIpN3wj
 Yae+OmWRXma5wF6sRz89h+LrPxqjfn/VyrudSn995OH1//3d+TYtREh0fk/qqnTbZPbAvTE3oae
 txZDmWRSUbF3zoXnSiU7IqhIXO9ofiAJW2n3BomMNe4XQLfvsmoSRAYBXedRDGAnckohhi6OUAD
 cA3uJz1SsxXW0g5OK6f6Kf3I3iytKvJvqiGe7tCNvUCUZJdF12ML7oTlwOBrW7QN4G/oIvnp8IW
 biCwgF/6hzS8mZ7aWZQ==
X-Proofpoint-ORIG-GUID: 7ASOr3JhFaUiwXQxLxYML4mI5CF5tShi
X-Authority-Analysis: v=2.4 cv=HrNG3UTS c=1 sm=1 tr=0 ts=6a1dbaaf cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Dupxt9FihdqWuyYA_w4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 7ASOr3JhFaUiwXQxLxYML4mI5CF5tShi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100032_403859_4E658A2E 
X-CRM114-Status: UNSURE (   9.30  )
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


On Tue, 12 May 2026 10:23:49 +0800, Miaoqing Pan wrote:
> This patch series adds two defensive sanity checks in ath11k DP RX
> handling to prevent invalid memory access when hardware/descriptor
> contents are unexpected, especially in WBM error scenarios.
> 
> 

Applied, thanks!

[1/2] wifi: ath11k: fix invalid data access in ath11k_dp_rx_h_undecap_nwifi
      commit: 6b471e9aefee9ed73278eb1141e0d8530a56fae9
[2/2] wifi: ath11k: add MSDU length validation for TKIP MIC error
      commit: 4d8af936b4fe377f3d7700540f301d8e45e8759b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


