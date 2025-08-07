Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CEDC87FCF
	for <ath11k@archiver.kernel.org>; Thu,  7 Aug 2025 21:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c0YZ3YLLvJK2KdMo7JoUScJunUE/MEJzmwquZliu5aQ=; b=IhW6h/uupXd+TGIegkDanSntGH
	1EkmmDoZ7AixYos7AD2h9DrTC8O5P2KR+hizsSwFlhy5cFTLhVAdho6f9/L3U7dxbqCtGL7nmaboQ
	bVfhkrVK1IYmUQHobFRWvTTKKuV9ckOnTHuVEhL+eOgvns1zX13fZ3ZlFbgozXF4Ghu2e0t6A5uiM
	YbqdUJpddCZA1PavEXaYaigXwV639vpGxfuMQZwNKDhntegeRUxZF1f86253sRB5DzuIK4Kbu4P21
	G95CqkP7mhJx88IY57ntXpRjmcjZkioV2e3sosuI6TCL6ZDAWgyh7BRLwdNBksoYo4pIZPk+fIGK/
	7FYjWAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8Ov-00000001Zs9-0NET;
	Thu, 07 Aug 2025 21:43:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8Os-00000001Zqw-1cSB
	for ath11k@lists.infradead.org;
	Thu, 07 Aug 2025 21:43:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577EDJw3006876
	for <ath11k@lists.infradead.org>; Thu, 7 Aug 2025 21:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c0YZ3YLLvJK2KdMo7JoUSc
	JunUE/MEJzmwquZliu5aQ=; b=AqxKqiotMaKj+4zPmQwOMwJzOt7NovA+3yERsn
	2jguwNczw02rJtEEJde29DyHMD0mAuCqxP+u1ExQzuw5QRHKwAoceNOTKTDIt+UR
	uR3vooaoJwNdCknLTzfdz9xYKvAo5A6Q7i/b0YSldKWxcZy7G90yxCv9AvfXCmaf
	pV5F0gquaG7oBzieAjEVCCx3oVwoHxlTQZEybgegEbnEI5//nwKedhV/HRoSji+2
	qMzei8F3g0VPqkLRNNTlt+nqpQgLPQ/+GZrOgwg/MQo1037oQdyiyodmQhfEtIoM
	ReYSeJyPcaPY7fwFmS1y6ag2RsWqie+3c+E2rBAbd8OQEsuw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybfxh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 07 Aug 2025 21:43:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-240b9c0bddcso13859255ad.2
        for <ath11k@lists.infradead.org>; Thu, 07 Aug 2025 14:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754603027; x=1755207827;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c0YZ3YLLvJK2KdMo7JoUScJunUE/MEJzmwquZliu5aQ=;
        b=Y7G0cpPChD9bU1qKHZWJtt5XCvhfXB8xgrnO+a9mkW/bsgQv746vL21RJm8KnzXv70
         oJ3dJ9Kq2+vQdTjqTyRNKMx6MJyoQQHdjrjLSq1ow8rc0oPdrI2JAYOKXHLXvqeWmjGu
         5JZn25FH6BY5aHMQfWbkvu4+siRfzUSYHfPdiR6xntDJ6H+fRoI07byL3dA737Jz88O7
         aJ81FwFzAH1toPJy/Au8VqRNgiyurAIGt0sOM434py5hzt9DjaKepV/FnTKIq/dI8Sc8
         urzk23Dg9zpuV3QYjxf39Z6oTMPxsxCoh9jdTbcVdw59mOEMB6mzg88drS+5m6GoZqyN
         1+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCViMWzn6zzIz0l3YW9gvLJfRsQvlENqog2svQmkYxCbXzJFXGON7BssDBqrXwZV+HotRv8G1jc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDhaFs7Z1wJ98bijnDHbBiab5CZ2bzV4qc1nRut8KmjHI5nF+v
	pjMAc1wjiZvL+1mlG/G468t1HbiziKpPpft22KGdcvJdqT2KfHaBzIpYkAkxPyai/uWDXPLQ4YG
	PyzohlTBjWXaMw6tJKX2rAQIxT1WtHNOL0rEuYCmVT1NKYJYKT4PKArk0wJflaR3zmOzqxwdm
X-Gm-Gg: ASbGncvbxuewfR2pWQ19oDAonauomH8ICafbUBSRCVPCXUv23kKSiTfHSQEjhNF1BI8
	0l1xMHmbFA7PH+dVwQBCj19xZrFPicNb6Y1PpZ+qSaMz13txYrDV7F1IOJbKc8IgVnpHG/Mr601
	2cqxhDJd1szgJfvk6TscDDysDBuge/NnzlSRUVCv1ISMIlf2uTktMAmWYeon96gLuoX9N0QRpC+
	ewhHKrHT9Rxku0gJlYtpC4cyY1aCLL41S8xelFpu6iOw/mLP+m3JvP5QtpGgQer/Xc/r8rIpmQm
	CAGua7bMPQNP1iafto2HN+jEQruj4S/NuMJrFI4mmo7ijUpQpauyuxz47O9ELgKwIwdNZxLD035
	v
X-Received: by 2002:a17:903:3583:b0:242:8a45:a95e with SMTP id d9443c01a7336-242c203d43cmr8131685ad.15.1754603026837;
        Thu, 07 Aug 2025 14:43:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN6v2dbx8Buiz9mLDddezvlVyeMzN2wDlRLGfDM+oXmOvFCIoQRzS8Xs7yecMOzsLJVhDisg==
X-Received: by 2002:a17:903:3583:b0:242:8a45:a95e with SMTP id d9443c01a7336-242c203d43cmr8131495ad.15.1754603026374;
        Thu, 07 Aug 2025 14:43:46 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a917sm195015435ad.116.2025.08.07.14.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 14:43:45 -0700 (PDT)
Message-ID: <6e3e8199-814d-4969-a951-d6b60f60257d@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 14:43:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath11k and ath12k firmware ath-20250807
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX/atuvnOAuorw
 zu94erm5jtgkB2XE8wo5GfVz0DOqaLTWLNj5Go5DR+304xVWh4C1DV7rfNXg+fnpEZ/PiaNdJce
 rI0a8/ZdPU0j0/hhItAe2akOzvUYRyUzhOlJwjo5/XfPj8tzSXtaOfWg4eh2I/0QIQRjEAkCTSF
 pMnFFG1fxNekN5YnrniFmp/8uI1yM3ReQhMx9B+8xb1a6KfHi1H+LBF+9jEZXU6na4UV1D+HUGj
 5ik9FGmpgRSthw21tOgWreePaSfnLow0C8+bs2BILdD4jGmmiIzQUFlG26+AX35cyQGUWJd4niL
 uyJIKFB0L6dmh/4aDPvj7H9Eg6VBSL0kbrQ81Z6jshqkSk1ckHLmTLUX0V9FbWt/Im1P4E8A8NT
 Ow7grn17
X-Proofpoint-GUID: BSExM3xI5wBP3uC32nuTrwNDvAo24Tki
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=68951e14 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=8Juthw4_Jig8fID-B6sA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: BSExM3xI5wBP3uC32nuTrwNDvAo24Tki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_144350_532717_20A45C98 
X-CRM114-Status: UNSURE (   8.37  )
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

The following changes since commit d30c7b425f6d9c9e9f54bcafa99b375342b3a774:

  Merge branch 'robot/pr-22-1754588181' into 'main' (2025-08-07 17:52:32 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250807

for you to fetch changes up to 35abebaa15c1ff1a141b7c24d79220ef70f48548:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3 (2025-08-07 14:32:02 -0700)

----------------------------------------------------------------
Jeff Johnson (6):
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA2066 hw2.1: update to WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04650-QCAHSPSWPL_V1_V2_SILICONZ_IOE-2
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

 WHENCE                              |   8 ++++----
 ath11k/QCA2066/hw2.1/amss.bin       | Bin 5349376 -> 5349376 bytes
 ath11k/QCA2066/hw2.1/board-2.bin    | Bin 685144 -> 745408 bytes
 ath11k/QCA6698AQ/hw2.1/amss.bin     | Bin 5140480 -> 5005312 bytes
 ath11k/WCN6855/hw2.0/board-2.bin    | Bin 6429240 -> 7056532 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15392824 -> 15183928 bytes
 ath12k/WCN7850/hw2.0/amss.bin       | Bin 6078528 -> 6082624 bytes
 7 files changed, 4 insertions(+), 4 deletions(-)

