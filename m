Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6840E9D41A
	for <ath11k@archiver.kernel.org>; Wed,  4 Feb 2026 17:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8opFdOz/tc1NxrXdMT7CER6PwqQ8gtJ2RmFX8c40zGk=; b=ijtyZ9U0BgHXZZULQxDRzjsv5w
	TLeUMYItG+5qlCCaIAv3Q7XNRfRHPuJTMD+UqNw/iI0xTO05ywtp8FNe32g1jwqvIjJQpI4evTmix
	duLCly2lWYVP4X7FcU0cdBlwS4H/pX+MMgIJ1YkQNnNimLvCX0GPQhHxMEEWEII47D1b1hwtEuGao
	VMD6zTHGFHnWpsks2AVd48vasOn1HRjRJyoHeUzPoAg1O6MAswbYTGg1PV1lKCtRQPtS8mwktFBFN
	8qRYqrMbWUW1so/RRVlJUhlVeoebTgaVclOhiOWQXYP2RWWCfkKjDLsOcZOeaKiej+bkCo/Aapy6z
	oLvpWM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngW2-00000008qBk-3GSL;
	Wed, 04 Feb 2026 17:18:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngVz-00000008qAA-3DB6
	for ath11k@lists.infradead.org;
	Wed, 04 Feb 2026 17:18:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614EGYbQ926571
	for <ath11k@lists.infradead.org>; Wed, 4 Feb 2026 17:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8opFdOz/tc1NxrXdMT7CER
	6PwqQ8gtJ2RmFX8c40zGk=; b=Ks9sF/V2fez3S/ZVEalIMMMix3TE4RWWsl4hye
	GeRpXhA27IIxmC/RPeaKrw7r6YctIzFMAE5/LAgIjksA4fEBinvshUEW3pknapMi
	08NQU4AyK8pfePH4ICxyQ7UmoQws5BbeQ2oHqY8/jm7ZxWyKRPXd9t7sFjjcKSz0
	v9sP6d+cvEfedSYM8cqFwK8Bnvr7rsmcZXw47eU9ou3jHdHeegnS8i9qMG/CBdnc
	Q+bh6H2jL67g38xbdPJzjw2VZLCrhVqmWMPVmGRSXcU1whLN2IHmw6gPXJWj8LgB
	hSNQmq2IhU4AmFKg6UwakbVY+BHYDASfg5+sHQIP32HWSNsw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qv8mk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 04 Feb 2026 17:18:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b71d3ac508so6672268eec.0
        for <ath11k@lists.infradead.org>; Wed, 04 Feb 2026 09:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770225486; x=1770830286; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8opFdOz/tc1NxrXdMT7CER6PwqQ8gtJ2RmFX8c40zGk=;
        b=X9+uAS13cEPBoI7+hsP0EemMxA7sw4r+5m7AA7FGZyQxbNeGt0lwSxIcnDD3GoZqaE
         1fcLfM+NsJb3Gr9PRxyxe918uc5ls1F/ZemuApIYxvZ6YDBMy2ndm6fqz41yQ9k6pCcR
         mjcygf5ccHf3fLlAir5tg+0KImTYtos51wy/0QIj+bCvszkOanTFfKByOmb4vsIgeFjk
         /IPutoFTkNYgqQQ8xEHHnt/SPLuh+D7CSX8KLflSnur6uPwmPKBDPe9EzvYy6Mjj5SWx
         6C0h1ZPWOG7cM/QJQDN5RGxoF0xUvNI2tqTXkdsgAF7eqk0Zget1luNpa3JUEThB5/ee
         M6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770225486; x=1770830286;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8opFdOz/tc1NxrXdMT7CER6PwqQ8gtJ2RmFX8c40zGk=;
        b=eUc3OClhzlmPTReSfgWNcZVLUR/6CLLeGvd0Q4Yrlq+8O9G4qrczb5HDvI3p18D1P+
         URIFYX/QInNKt+aFfAIUKQgEcxxKGdlOrvl+UEonNmPDOjb0khiN+wLQaBVG6zzTxJYv
         sLYgHECRmhHcynOcuQAmI3k2XJEOxaKpkMQm5/zUjWTAeGC0L4ICze5320i5BNlor9dm
         z5JvKx1EjMBUeb/bQlKk5/dqu6dVWF5wHeTLgk/0uBQhGdFisUP54T3BdzE5VmWmklec
         FBz1KdaLmrPorp3YDRx7/XxwauZum4MZYWCIlKvbf9QA/fuJsK6yugIrLxdH4RtywFta
         FMrA==
X-Forwarded-Encrypted: i=1; AJvYcCVpJhI6VFpSId2iWxlxCi7Avflu5LZZYt2ZlaE8ZQm6w/WWPXWlavfrwMjZXfoNC4F1VqUhA68=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTqIywKmSTqMemRal2/hdENydVQN5VqD7YPDrJKx5qW/FJcvuA
	3GorpBhDHA6nH6gDc8tk7ZWeW2oUPeWqEgZ+aY1PGVU7ex2M5Kz69NxRJKx2uRy1X1WYf6okNFT
	dZPoOkRaanQluSAfJCJGUWrpq1fA0Wha3+mKwpNTstygw88l4btCelmEEhSHUZf5w
X-Gm-Gg: AZuq6aI4hASG10vB1d+iU31NNpR31b1HVLGrn4zKlJOa2XQYAXK8H6gZe125R94buaX
	fI9kSaZZxv3xzBN56WPbELZbifBRralKP+ehPDT8uRyhH4VYBLRXpvrr0aaT4O7qRd+JvMr5mja
	sxo/LWedVM/QSJrRTDrRVMIWtzv7GvmrsGNLXqcx8m7x6OIX/yNIR0mc03kfMsgTv3tHyaduQqE
	CrGWgkyVzKFHqghbgP7j7dNkeILOAyCv3loS8s8TjPzJDKU+BnjxTiA4kWq/u7iw7aQ47RfB2Qd
	x22vaXc8bssM+TcIhe+MOCxQFMP2P9QBTJxMYSmotYKZWOXWjhxjW98yKs/YV5zEtSf1ASp11KP
	zfvJyYGmcJ7M9DSNDo83bEHlo/2z3kfCTIgcIUsMwkJYnmQ==
X-Received: by 2002:a05:7301:1008:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b832919b37mr1535419eec.12.1770225485600;
        Wed, 04 Feb 2026 09:18:05 -0800 (PST)
X-Received: by 2002:a05:7301:1008:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b832919b37mr1535405eec.12.1770225485029;
        Wed, 04 Feb 2026 09:18:05 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f5030e22sm2490537c88.10.2026.02.04.09.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:18:04 -0800 (PST)
Message-ID: <18adf454-8e66-4b3c-a6a9-81faa2c57602@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 09:18:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260204
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=69837f4e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=DW_G4QuS8ySNF3ajTrEA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: XRwkd6RPwHFwsosxq--X_D8A-e73VZK7
X-Proofpoint-ORIG-GUID: XRwkd6RPwHFwsosxq--X_D8A-e73VZK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzMiBTYWx0ZWRfX/KQsZSW3GPuZ
 QtHHqk3zN4uX967OJD607Om97iA+xzhsXPUXISIxSvNklZpH3sCGkbHRNLHvceBGBbcxtQKd1bK
 UpUWAsps0azw4xNvqPVhsbWXe4RGefe1pkXNlmYgj8v3PRYmHNDQqC7Z5D0VGM85WaNW93Qj6r9
 EVQH+mdh0I/fmxnPzKagzUKSJaDXCi9BHZ+7wPfrGQCZEuIEhEyOw78zz7787ibC1IMpeTLrRxz
 IW44CCaDBm8rU+JSB5f/L8CMcyZdvQ8AlEEN2CWYAfMtS+zOZFFVIuJN8zTuN1v0hsPAXvaWyh7
 laRvacNeBUn2fxbIvogOeKRlGXKMnkOAR6OUS2eRE/2SRdanTtHxcIi0+4eKHgX5Axa+JklqzB3
 ARzx4CryEM6YdoSCIoXoFR+2/re7c3Eu+Q3/OT9o7NiEsFQXt2Zia8Z70ktxit7pdfjd7oXjGyh
 zGI5HTVw14x3GE0pROQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_091807_844502_E54EBFD0 
X-CRM114-Status: UNSURE (   9.16  )
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

The following changes since commit aeea3bf80600892be582a61de1551cf431341d9e:

  Merge branch 'robot/pr-0-1770184708' into 'main' (2026-02-04 09:13:00 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260204

for you to fetch changes up to 81a99dba039a21fd83d37a67a7de0fb80152e065:

  ath10k: WCN3990 hw1.0: update board-2.bin (2026-02-04 09:09:43 -0800)

----------------------------------------------------------------

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

For ath10k update board file for WCN3990/hw1.0 to support:
bus=snoc,qmi-board-id=41,qmi-chip-id=30214,variant=Qualcomm_sdm845hdk
bus=snoc,qmi-board-id=55,qmi-chip-id=30224,variant=Qualcomm_sm8150hdk
bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=ECS_QC710
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_blueline
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_crosshatch

No updates for ath11k and ath12k.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990 hw1.0: update board-2.bin

 ath10k/WCN3990/hw1.0/board-2.bin | Bin 742192 -> 867116 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

