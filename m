Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E934C54F32
	for <ath11k@archiver.kernel.org>; Fri, 23 May 2025 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZUadBFHdEtu6nVasWJSp0TAppzK35LzVtrVbC8Wug8=; b=jiQPEzFnQf6HvYJnietQMuPFPL
	xeEMR6bSp+eKuBpOFq+2DeqJy21w1GRI6srnd38JLKDnOvZL0s0EZsNTLmlbCdwoviZCeuAD6COoO
	WCniPH1GfER4U2bV3aqB/ezQ6Wmk31jqGRbNlPfD0vFpdNy8g88WBmIPZpPWLhpaJlLTM5Rx+p3wz
	mHSB17lAIRT/ZC9R9okUU5bEOKpKmmIfreAIMUTnJrv5ABR1JoLjuXSXIymq8dZdDpPv77fRP6r+N
	w0BvybkCkHaCJsfR5hKoGFUpD2C4ntcjoImv7UFQzaErMD2ursEgU0Moah/11EMWwufPAOUWctQb2
	nGaDb0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7P-00000004WnF-3yh5;
	Fri, 23 May 2025 17:23:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVsM-00000004UZg-3PmG
	for ath11k@lists.infradead.org;
	Fri, 23 May 2025 17:08:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCF9sx029170
	for <ath11k@lists.infradead.org>; Fri, 23 May 2025 17:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tZUadBFHdEtu6nVasWJSp0
	TAppzK35LzVtrVbC8Wug8=; b=VIsc9/hahModkP8X3PA1B8iC7GVr0M99R3IrGE
	aXOMtHoA+grJu4k3WXH+JuWtnc7F9fefFanwa6ufBzaL+31aP6GpUT4eTozFo5DS
	+uP/sPxDGnjFpdOhZajBfhanvUa1jy6YDpHtixdCXg0YASFpmfyLd9GhoWHqS4Ps
	9dIAJmh+pAOitJfq6Ga0yKPJHbo6QjdRxaVjLt6yKvymZXiolw382/psU+TPAEbD
	7ObJeHHx24IO0UAmz7b6jQDX+AL18ucjLChTa5ja+5XwGW+SkFCmVcaktjKh/ouo
	ggtOOWkfZxkyf2HAI2he2QxssLXXfZbxf2xizW+CGaf2hA4A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4at0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 23 May 2025 17:08:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742cc20e11eso104896b3a.1
        for <ath11k@lists.infradead.org>; Fri, 23 May 2025 10:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020084; x=1748624884;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZUadBFHdEtu6nVasWJSp0TAppzK35LzVtrVbC8Wug8=;
        b=g+DcVKl23MWrVjYUcgpoud8OMX0GrJfpVzoMpxDtWBhRY9iUsIdC+QD7dE6sjwflPv
         de0G0RDMOGNgYeFCo5tArlclffkP+GKqmgaFSwzPuuR7C64q7dxsY4wq8b+7DloydQol
         fJsavKRVm4DQy9c47W1n3H3Kl5SmNNWPkZKlg29zlAPBvOrmFloXWG7gLxWgOR37m692
         AqZ4RuqOP7GtTr8ke45q/LHWc4W0mAam1anF7vn16w4ctM/2CW43YCq0QcJ1gYjtaJ6o
         /5byFtFW/iQXF3xSAbXs5e64TQlXvgebuXVhlAg5/3MgUiG+4L8hZL6TaRFhIppKbvI+
         PPQg==
X-Forwarded-Encrypted: i=1; AJvYcCULk7yJKutnPdm6kX6QsSmooZws7UUbsZkAXrm+89fAwElxvf9FyplmzKEmjc6j+XlRNi9371M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6II2QTlBLU8ghA7EGu6FwF3wVEZeHekqbuWnXtlsQQuM2F0nC
	4ke3M9dAfCKW/13RaNNvXV1jMeHZYODX3BNGVriAvE5603NUIsVb3/uM/z2i0CHHg2u1KyufDBq
	ggw5u+I1k9XVaD6GENPE/Zo5MyPDtrMnVZrPxf4JRUbaFbwzXyuO6yXfJv6g9Ahaz
X-Gm-Gg: ASbGncsnxoANcJjMw/Ea21xa9bdUCEap654xuJiPzY2jCuMlhfm5VSxDIIme5BP+sV3
	NFWvz69sizFkocJCXacxXgN/lriW95iI/di9dNVcHIjioBDqRNmVmwxtnAs6NP2PBPY/PwjHyoe
	58Sxj3Ulsa42t87RohjPTNoajV/x9Ve5eXLuJDkk/mPHTZMKTaUYGI26dYs11lXQSdWWOsaNKnH
	5mNnVw7yjwjcGU0t6zsUamhEOPF3vjqRlsulPAsdNxH7tBju0L7iwrLNYrQRUdSSkP8wUtTBmU2
	qMOluDV3j0xAmrWtqvwzbHGcOA2Dpvu3vJufe+YUPnbHpcD4
X-Received: by 2002:a05:6a00:10d2:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-745fe03c2damr380006b3a.20.1748020083887;
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5x+zjlejQD7iUhgZen4iAhbFV5wkG6YLj4vbg91n7MooaF52e912rywgPZgF74Hdf6hPSIA==
X-Received: by 2002:a05:6a00:10d2:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-745fe03c2damr379983b3a.20.1748020083500;
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829c37sm13084080b3a.117.2025.05.23.10.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
Message-ID: <fcfa4e63-e421-42d1-b6da-11d2d7d2dd95@oss.qualcomm.com>
Date: Fri, 23 May 2025 10:07:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20250523
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1NiBTYWx0ZWRfXxCfkmjfj0MOw
 LrH3mGLp1Q3tLyWwC5tqcBOQORXyxOT2oCRY1bbwawegfAn9T71iRet0ouDckfe/C5HVWkYMyd1
 VOssKDyqA1E35vzpiNxGYly3Ns2xfxQMa0MdxY9kX1JN+6dTo5QDMMXxuo35dfTgeVSw3/yxWXS
 yJkA0mEuOSAVD01rzR0ZHHMEyBGcUO8gkVoY5e7o2cQCXwbjK4gPQUfEZOklXfO8/yUUmHNnHDS
 zqrz+bzUAP2kCNhYhtKfyQY9Expb01o0cBuKoW/YoBXmIFHBk78UUvxkqTFVIJwwosmsRnOkztK
 hBcjzudje7YZiXE9UeVPjQuOkeg6mQy5RTvb6v9EO8qESag876ykqq0UfcFd65f3x2aLN2oUWkB
 Z5vwcIEqrR71bfLxAjActYjJmtQypWK723bcd5QWw6ip+3Y7sLJKvx1r40RfpIRoWP9oXPJA
X-Proofpoint-GUID: QDF-DLABqhNrPdSyipPnnWxU1egD_eiI
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=6830ab74 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=w00LdxtAzVfKRbiaHPIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: QDF-DLABqhNrPdSyipPnnWxU1egD_eiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=921 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_100806_853749_0E9ACBB6 
X-CRM114-Status: UNSURE (   9.49  )
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

The following changes since commit 3fbaee2775a4a6d44021aa035823a7388b0874fa:

  Merge branch 'robot/pr-0-1747839277' into 'main' (2025-05-21 15:05:37 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250523

for you to fetch changes up to 2e91d8c3c4bd34a27177180a38f62d3ba3c96031:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 (2025-05-23 09:50:02 -0700)

----------------------------------------------------------------

This is an update to the WCN7850 firmware that fixes the widely reported
failures due to the prior version in ath-20250424.

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

 WHENCE                        |   2 +-
 ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6078528 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

