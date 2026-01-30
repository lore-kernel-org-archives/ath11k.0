Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF47E6BF37
	for <ath11k@archiver.kernel.org>; Fri, 30 Jan 2026 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gKtVDmhXmolTIN8Uom22wNd+fElMtxvh9JofuLlixjA=; b=edibdD9MLy7Ej5gaEJFHPUwrn0
	nVAiozvlqUAY8jwcGSujKCwjYTN5tXDgfzCiGvs8lzu/9vFL5vZgXD0eiq2m4lUH9hrhnrOKHzvhE
	bPwAQJHOtcmQWV5hDSx1UuQhEy8yWgDlfMDXouWXZI7uuBKg3IMtH1/69FicQToASOqvyxlO5xWy7
	WeKtxF58nbYkfaK9+WxSjNzAgu7KTKywJhDXjWhpJlvSrDVpypLtC5h7W40ovPDZuva8+eVwBDeXR
	gMpbkDklH70rj8PCvwjwIy3otGd0BrdVmjHmY3cXNySEfftkHtG9iLeTR8QaL9ah7mRZKtKrq+QMw
	6HtJH+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlv7r-00000001w2c-275t;
	Fri, 30 Jan 2026 20:29:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlv7o-00000001w1S-1ISb
	for ath11k@lists.infradead.org;
	Fri, 30 Jan 2026 20:29:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UCV7HE2295334
	for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 20:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gKtVDmhXmolTIN8Uom22wN
	d+fElMtxvh9JofuLlixjA=; b=FQXCgx1ufEA3QJD4xNPENvAhS5CWK2fL9cmRCY
	XSRN6ftPFqE4mAph+/5oGAQWBg0G4dRgBg1B+oRwSnNVEQh2yll5Ql9g2607M02l
	kHnLjgjdZajf4Lo3VmC/35oywoJ6CjvCTfQSEgjODPBzZN6ra1yWX9Gs2V9IbeRv
	TBWL0NveMPnUHbADWAK2AE2xc2PE76m9AhoW2k2dMxrr83hLUGOtPW/VfYuO0l8b
	3ke7sLgfWH60olY6omWuLb9+WI52KcnMHvuFn8fFv4pMDh8/ZVfv4wN3kBTJX6MN
	Ea8x0+SEdhgM8Yy3sTpA0T0SSwbKeFZ3u5Qc8bYX5aVXNN8g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p1xaqxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 20:29:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b75222e9easo9316689eec.1
        for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 12:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769804990; x=1770409790; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKtVDmhXmolTIN8Uom22wNd+fElMtxvh9JofuLlixjA=;
        b=bVyd/P27hh4JAq1uvwvbY4UJptpJZUkp12VteroHdTw8irLiHSR2Gb0LCdLfmuF8Jp
         dODnqa2l4jdfvab2i3TP3s1l8T1N8isJTGn9ZzWoAB9rHm6njunkmHkHCOMFTZFGEjb6
         b8fmVypVhOVhXb3Ctb3pdT4p++wJdBo6b0LaiB9+YVl+IDozqk8+C9Fu5g/ahwq2CG2K
         4QpPjINSTcwj/9QDyrUQjAOxj/5vAsEpfeRim23DaCXFHP7bgDOr7y03qJr24dAZfNVX
         eNpT7qHW9nW1lzYkQ8JQIOHiiixUE01cCwxegRX6pHnjjfsJJiFpZCSwcG5h3U9gMfiH
         GoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769804990; x=1770409790;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKtVDmhXmolTIN8Uom22wNd+fElMtxvh9JofuLlixjA=;
        b=uVHGkcw+70blNZzRl+36urfTF+kLx92h+a4Qsa0A7vr8TNTInQsraLsriA1AXjmTBU
         30+7YZCu4otEug4yzjVM3vFka6bJ1h9HCj1b9c6ht532auYYFHtJZGlf2dNGJaaFyC7n
         IFZv4kwYJhQN35obgKWh6J+GgwhIiiW666p/i/oKYB0fpEwu6rHubxkKDYseDTdmWYga
         geAtiPFO3PHMeLzf8qyrIAr9X2k2fX19w1LTM3DoN5iZJ3EeSJAc/bH6yIwvhO9d2X48
         KzDZwfo7lMfdrnfeBGYHC5mf6eJybDZ3LrL2/zDygJ0lBgjYl+1xmcsJmAp9vmCi5weD
         08ww==
X-Forwarded-Encrypted: i=1; AJvYcCU2Mb6lZ2g147aFb2iTwGS5CNvHDZOM9crw08TZE+GnXIX8BIbAoP63v65rila4bGIajlkZ5Hk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwURysr8i2GvQvpxTtlKXsA7hbSXZ3xJyofLl9wwuXu2K3YKQ7z
	4ymH0U9VQlIrq+aPFYgpdzmFIsf3Yw0qtN5O+Zw9viK3Da/5cDXkzDYFib4Lz0eQOdn11In2V/x
	CdZw7+B+yPbhG/eK4I3FEvBsbKv3Lkj8FQm0VV381v3dwI9Is/aEUCz9NKoX6rHcV
X-Gm-Gg: AZuq6aLP1I0zc7iTWIgzNIwsjjBM7NUgCNWjQabKXddR9CQbIox0Qp9QgABPO9oDsrm
	orMOstoZ8fiIGVv1jRSilAdt8QPsPo1wpfsv/uUuHEkOVYJ0Iqe35d6AoEi2WK+PFFVmU7nTowJ
	2pUMDj3z2ohFScFBtMSHOcwyrSqg3YakBSxmOxyPoP6RZLEZYXdI4Fr7sflo7+Z3DNIg05Fl4jC
	XxJvZZsRLHQh9T5k45D3xfxkm2Tc8bKTONkUQxTlpoowbTa6c4JK5LEYmLoVAMKC66mlPoDa++O
	UmjQlhtMFOzTqm+mEpHJPTkfiM9WvSVslxZ4C1hw8zOXJ8V9odvSqdiw6Kca9P2knhXIDAP7Ym7
	ZE9Tz4MmJhTrbDrxeatpGDVpzQBunA3FKwdgKVwjKlHxUOg==
X-Received: by 2002:a05:7300:4306:b0:2b7:f7f:69c with SMTP id 5a478bee46e88-2b7c88ec6ddmr1953654eec.32.1769804989667;
        Fri, 30 Jan 2026 12:29:49 -0800 (PST)
X-Received: by 2002:a05:7300:4306:b0:2b7:f7f:69c with SMTP id 5a478bee46e88-2b7c88ec6ddmr1953639eec.32.1769804989195;
        Fri, 30 Jan 2026 12:29:49 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8d6sm12595008eec.3.2026.01.30.12.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 12:29:48 -0800 (PST)
Message-ID: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:29:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260130
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BdzQDGfTWN1X3WOkqyGYrmRW3yCNOt2C
X-Proofpoint-ORIG-GUID: BdzQDGfTWN1X3WOkqyGYrmRW3yCNOt2C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE2OCBTYWx0ZWRfX26GW1EZPwq/p
 WqSWOF3n7kyn6fKUYMN8cDW6Q6noVCyvle6af/BL7BAIUtEfbrXmQvOiy3E2+l+K2boW+snvprA
 nNm87o7ka4D8SXqbYi4+bfzPvicovvJ8BCJWjW3qISCx0QtZ4lHqkUmj+G0+JFa+cPYNarVYIAp
 QuoJXNGR7Zew6pajqVzktnH3R3MDCbvyuO/5meMQ1wpSb87Q03/krnix1MGPfEGvXwIB+XIds3N
 rvteEY6/5yX6hJhtFgCdOhCffnbF20Z95uBh4eXfBmb7XVDTStXvwMIBmyjTet2tGGmQzjjAVsW
 pHvAcUakI9LENPlXidepnphldY3XSqMDHRvq0mMVIIXl1AhdyCTClsy0EKgWU7iPpIZOf+mvPYx
 Vipc8Gd6O+DXlL03GjcHKwDgY0sJDswfaLq63N3D8AKk7xg5oc9bV5T4v79pdG34rZeDlzkwpkp
 ZTF4iiK/YXsxnThs9iw==
X-Authority-Analysis: v=2.4 cv=G5cR0tk5 c=1 sm=1 tr=0 ts=697d14be cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=xtntLAz0KcNX19M1530A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_122952_458854_90DA02D6 
X-CRM114-Status: UNSURE (   9.86  )
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

No updates for ath10k.

For ath11k:

Update board file for QCA6698AQ/hw2.1 to support:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_SA8775P_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255,variant=QC_SA8775P_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride

Update board file for WCN6855/hw2.0 to support:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_SA8775P_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride

For ath12k:

Update firmware for QCN9274/hw2.0.

Update board file for WCN7850/hw2.0 to support:
bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255


Please let me know if there are any problems.

Thanks,
/jeff
---

The following changes since commit 0882248d05045565bfefe1f07cbfc22276c9f058:

  Merge branch 'lenovo-ish-uspstream-clean' into 'main' (2026-01-23 19:26:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260130

for you to fetch changes up to 09167289ec698099435e499e45c5788015d26783:

  ath12k: WCN7850 hw2.0: update board-2.bin (2026-01-30 12:17:30 -0800)

----------------------------------------------------------------
Jeff Johnson (4):
      ath11k: QCA6698AQ hw2.1: update board-2.bin
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
      ath12k: WCN7850 hw2.0: update board-2.bin

 WHENCE                              |   2 +-
 ath11k/QCA6698AQ/hw2.1/board-2.bin  | Bin 986384 -> 1046928 bytes
 ath11k/WCN6855/hw2.0/board-2.bin    | Bin 7056532 -> 7117076 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15183928 -> 16035896 bytes
 ath12k/WCN7850/hw2.0/board-2.bin    | Bin 2253732 -> 2253964 bytes
 5 files changed, 1 insertion(+), 1 deletion(-)

