Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD80AD3398D
	for <ath11k@archiver.kernel.org>; Fri,  5 Dec 2025 16:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uY/zz/FmTheKinzMsruxPAeAFgeFSh6MXrbrP2Vw8Ck=; b=EsFvZ1f5D0ulZF5hI6VwtYajrA
	eVrHkS7CfNb6NagKNyQvx5bGFd7BU3NFQEX643IfRMhceMNTPVE3sVkTNmn43GyFGILlohKw5vsB7
	omcDfFBimajTcPhvLCov/3PozoDXtZx3LUgz1o6wPbRExDiYGZ00sWmrTtbwXv9aEmI4sCtqVo2wl
	JZt1Q6/rmxj9/fNfw4z0zN0KL3JBp/elHB2xSda5kFmJNbgYyN9szKSFjvBh1na3upr7FSeoJYvLH
	LYumXKtOSTxthbps30dZOvZqkpR6ZiDv6B2fpZFR0A4AP4GPlJ5n4X+zyHwn7nKPXDs46aTuX0DWB
	XH3FwupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYh8-00000009hmC-1xrJ;
	Fri, 05 Dec 2025 16:30:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYh5-00000009hl9-1VqL
	for ath11k@lists.infradead.org;
	Fri, 05 Dec 2025 16:30:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBQMf1028360
	for <ath11k@lists.infradead.org>; Fri, 5 Dec 2025 16:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uY/zz/FmTheKinzMsruxPA
	eAFgeFSh6MXrbrP2Vw8Ck=; b=AmewZFZuTpnfOwXbHKGEFposUfJyFi+9L/sM1r
	dSP3z8QBY0s66WGN4QyK0LiJWmXsSTQKVNyoVvL4s1MnLL1Rhj7gRAT4lNs2nURK
	dXHXbwhxGEmkvjv8VHTbYeo1HDmUf46r0p770SoRRFiX5mGiFt+xObRaXGrpEgo/
	CnIpWfQmW+Sgv/N5Ch4PPntC5ALF1km241FZ0pnT1Mk+k1E3nLSOj1W54UjHiUhv
	6wxXjP38eeyJj3JO2sFOcSCJadq8QQECu5O9iFXzot9W7jffAsdqNyk0UiBmYzZh
	gqmSJhtxjEUoF3w2O17fdLobl4KIkCGudqsdbL45Ahy+TH2Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n2u7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 05 Dec 2025 16:30:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-298535ef0ccso29919125ad.3
        for <ath11k@lists.infradead.org>; Fri, 05 Dec 2025 08:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764952204; x=1765557004; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uY/zz/FmTheKinzMsruxPAeAFgeFSh6MXrbrP2Vw8Ck=;
        b=hm/t62rjCIJeiS1Jrs9ZTw94O47PTV5IWf7zCyEb/aqWiUSrKWp5k6jaiFHMw1EzHc
         T1H56vM/MI5BaDeZP1gT80jIM+aFQyLoIdCv2o8Xj60PTUDaHEaFuJW0Lzj79NQPhHhD
         ixETmv2J9N7O4fODgecDKr/Ju3j8HAfFR8Vzs5pT4o1KCiZbqAcEfawS1STZQ0jX1QgO
         xbHfJYYSccNcJRuXJ7+5fTVgDrQruez4t5mOxKwErLE2i4XYDzEH5YVytPn84CMaCkIr
         NV11ySc1tH557qwVLYEfE7nRlkh5Gh27zax6k6kbu/3EuDbKHckjni8XsYeLRw8JliVF
         jcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764952204; x=1765557004;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uY/zz/FmTheKinzMsruxPAeAFgeFSh6MXrbrP2Vw8Ck=;
        b=RxLf00miY6RXACnEyWxZiRuLauwsmk8rS9jTCBhgu2JSwcsPWCkUxBjzJtJADGo5iN
         egED98ehQiDnnt9G2wKuRQRahmlO4ukk2A1VFCjKypHrYR/uNipHQUSsesCXxmx4pCl0
         oPuxxioshGJpJvm3h3ewgoPvgo+7Zp7KvxTFWPLxLXHuB+1SId1onKAr10zHhxknHMqJ
         AEMFiaRf1Nj8n9wy2xCI6SAXGHViOi8oBQIxvSt4+i1Ojr3WAmGB1F8InGJKtmSQ6wmv
         pp3+D1jrQVMDc0OObZ/EKCAmDEaG3M0DgZw3mRIBcywqO0S2KGchPp3a8mBfs6gsTXku
         kU5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLYyIM22yRb1O+UtdNc9qVaKPN/1JhXgbxqOVXt7/jFEWbK8Xm1ap+tJZfG+/WrsDVbrGWd6M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEMmWH3rT7PCK2eDUqqUlcG+vFXd3fdYrhcvStP1tyoRdVbXw3
	dGvANGMRrMi4LHK87hbtmC1WxeJxQxjMyEYW7PXj+j8W0WGCCc3hZFArFsal2HAlsRUjg60FKgB
	Q+V+/2ZJAz/wcXniCoWsYt9qb1eKckEBWZnVCAhL7WbCsXBPKgn4DP+Z8QjwrrVdqvjEEuy/J
X-Gm-Gg: ASbGnctNyOaxJSPcM6nw2GjBzoH78vJM/7Gq+izygpjjDqKPZQljVWZUiUeSnpku7Pa
	u75rE3cDoMAOOmsvij1pbofmIw0hV3R9gmI+JMKemFJK/rf2rmljPOsaiI0RFu4DVPANT7+c8+R
	5Yh19uetJc2jwa4Ea0QdmGxEgmSZVUSnH47/G0zjOUJo/SNU0APpz3TAdEpk7YfWUjik5csmAZG
	zbo+xgcZPFODNZzaH3qHqw0hHQCqM+G8ubtapPW+XwfrAwCY4e1pXBP17U/zsr6NdOnrgKbSrqR
	XugiQOQtRDYJZ+sv/W5I0RpVyORTQdIeXg0eHxWWUcHH95zIGOv1h/fCafv8puwV0KoksyabSc/
	/omaEQvQJQM5RC81LDwZ2iGyU61uGnwatTiFz+Z1Ah02h0w==
X-Received: by 2002:a17:903:1b28:b0:294:ccc6:cd30 with SMTP id d9443c01a7336-29d9fb6eb47mr88186845ad.17.1764952204101;
        Fri, 05 Dec 2025 08:30:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoqCm17nT0SnoxUP5EoDhHux+tD0gpH6iUAYDqqKgBNd2YHlT+I8Pl/pJ4QXlhgtjs1gu46A==
X-Received: by 2002:a17:903:1b28:b0:294:ccc6:cd30 with SMTP id d9443c01a7336-29d9fb6eb47mr88186545ad.17.1764952203564;
        Fri, 05 Dec 2025 08:30:03 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae33c2e2sm53266725ad.0.2025.12.05.08.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 08:30:03 -0800 (PST)
Message-ID: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 08:30:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20251205
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=6933088d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=81yDGmwx11_j3xA_CzoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: tZO8EurUdAobE_FSIQ9kChGXdSYDZYPV
X-Proofpoint-GUID: tZO8EurUdAobE_FSIQ9kChGXdSYDZYPV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEyMCBTYWx0ZWRfX2tjf8DPhlWj5
 SmBGuOcDOHV6znz3FmFhMomVXVsP0Bt6aGQQS2eyr1jrL03vOLqcVnaFCry7UGgAUUc1ksAPibv
 grI5Mo04feGN5jA/FxP5ItoARN6ko90UxYlz/P+9m9Rt+xKLBT63H3hbzeaM/msw4A+MkVKjX5h
 M6DN3wPbISEUVTpIfnhVtUTRH/PDGd9R1PAKlFZLJW4bATgsNfSLIvTs64yCBdJUJK1WWacLNpb
 H1V6qodB/xtf8DOFPRIUweREUXg/a/aSPw3hhdEBKZrmISQfuE4+SSKbkgPq5WOWV2gVz+xdOjr
 pT0sOt50Ri7tCslQMn6BSMwNGTrr2lynVVVw7jnaWXD4mIxOLERMBM2M7mqRnMe5Ysf/dVj+v6F
 kwlvtj2RUOsSsiRZz7WiEUmmF+we8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_083007_533411_06F80FF6 
X-CRM114-Status: UNSURE (   9.07  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

Only ath10k board files are included this cycle:
QCA4019 hw1.0: Add Netgear LBR20 specific BDFs
QCA4019 hw1.0: Add Meraki MR30H specific BDFs
QCA4019 hw1.0: Add Meraki "underdog" specific BDFs
QCA9888 hw2.0: Add Netgear LBR20 specific BDFs
WCN3990 hw1.0: Add board file for the Arduino Imola (UNO-Q)
WCN3990 hw1.0: Add Xiaomi Redmi K20 Pro/ Xiaomi Mi 9T Pro specific BDFs
WCN3990 hw1.0: Add board file for Huawei MateBook E 2019

Please let me know if there are any problems.

Thanks,
/jeff

The following changes since commit a0f0e52138e5f77fb0f358ff952447623ae0a7c4:

  Merge branch 'amd-staging' into 'main' (2025-12-03 21:05:40 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251205

for you to fetch changes up to 05c97f71a5336854054db1dd4acdaf68c5b7c144:

  ath10k: WCN3990 hw1.0: update board-2.bin (2025-12-05 08:20:14 -0800)

----------------------------------------------------------------
Jeff Johnson (3):
      ath10k: QCA4019 hw1.0: update board-2.bin
      ath10k: QCA9888 hw2.0: update board-2.bin
      ath10k: WCN3990 hw1.0: update board-2.bin

 ath10k/QCA4019/hw1.0/board-2.bin | Bin 1822336 -> 1895232 bytes
 ath10k/QCA9888/hw2.0/board-2.bin | Bin 218596 -> 230744 bytes
 ath10k/WCN3990/hw1.0/board-2.bin | Bin 670116 -> 742192 bytes
 3 files changed, 0 insertions(+), 0 deletions(-)

