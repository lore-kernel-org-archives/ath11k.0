Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC09C88E4D
	for <ath11k@archiver.kernel.org>; Fri, 11 Sep 2026 22:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=; b=cKAozxEnlB4IJjzi5syOr8Q8mi
	WTyKR9ENBPQWOuFqyT7/80QtIvxwbPN0aSD9Sx+QQcJ+97iBYeDQVWJG3+THLy/9g479NFgY+3Kr0
	D+/yl//sQg2bVn00CNgATf44w0H2mAKqCN4es65cwEpKIbdqrh377/qcW1myjb1ezO5psxKbhYfF7
	gkkZMwq9Avaz/68JLK1oMgN8135ybkQww6oP2+fi172geOyziL/2qb9vKsSYvhGf4GhvSFVv452k4
	yHdQgiS2fEAALWsMzVtDNbKJk2ypt+W3d4AT3mOatfHwMhFHqUrDwSgbGdGj/jaYg1n/1Iv8tsM2w
	l+UKfNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Un-00000000EkA-0eYH;
	Fri, 11 Sep 2026 22:13:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Uj-00000000Eib-2UqB
	for ath11k@lists.infradead.org;
	Fri, 11 Sep 2026 22:13:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWjYL3622050
	for <ath11k@lists.infradead.org>; Fri, 11 Sep 2026 22:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JYwTxVAwAAEy9xr61JO4H6
	DlThANBCiqbXJNrMjjvpc=; b=GRUeFQm6/+FKi+X3HvnS+qPpR1BJ3t5z+FbdVZ
	AKOn/eTE65GbCG2TRYO8myNf6T+DUPZSKP/F3g23x4Kg3JuDyFVEssqfOqgLuJIf
	mjIn/J+ZLc3nTVeJ7fDzD86NswFg2uIQiao1LuletsNewFYheXRGZSXrn7ZKZpLY
	65mlirpqrnoWxIZpBsBarJB3IM3g+ok3daIDfaa1apwCPo/d2brt5c43zDes64uW
	vFcGhKxHYCOyUlBzgFM1bVHSoXO8rG1VrRCCcCDD671ozhz1UgaVAaPPjCh616pV
	JWATxbaCPTqf1GmUy+LMyxpOY7lYSxKmvG6BzXPUAyFeHfzw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmmubsa9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 11 Sep 2026 22:13:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso2330650a91.2
        for <ath11k@lists.infradead.org>; Fri, 11 Sep 2026 15:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789164796; x=1789769596; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=;
        b=I7BRJb+tve2pQFLWAG07DiMwQZLiTo8mFTieuUYWXF7gRCQDEeZaOAH+SFNPuwMAC7
         L72KyqQAUdJ4HR/4QE8NrQSUUUYKPjhVKaNexvn61jl84wAPSfCxrkWdNzU9ETyLsS2T
         isQ3h8EEM7mi9qLkyGoT2VC4ytWDMPEhRkKnQkg1WvJGFYf5FmN2VSbDC3hnXkE7vV6N
         XAIRrZUG0yl7zRnE8b2XzOT07gRGA4lmEYQJgEE+0GJT5c6pdam3U7kbIucsyrfaE+bn
         7NidtudhgXHN6/wl+rFcvhIhVF7ATZMZGT5GP9ItFOagx5R7+AYtSrGZ+6IGT0JbznB8
         GWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164796; x=1789769596;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=;
        b=mCSx6cKEXiFZWoLC2eLam/nHDo2C39vB1fZCQya33ujDpnIT3P4duglKZnITqklnH7
         A4Kdg7pHvdWabaEVeb/9EzSmCSJRqbToQCga1tlTvV4trMB54aRVontMhBZWjPNoBtyB
         A0PdHNMIHvZRmqFjR3pV4M0jp62OrsRDaDovxGzU3h+YnI30WtGYk+1VJnZye53ptYAs
         3dLHHonUa9fUmPHyLWB19NR4FvsjtoxU4vQzEucC5sHdRJ0WPy1DZfFffi5Yq+Lgy6w9
         oRVRVJ1HppUXq9gY0JOVB4CxbJEfQGRTeNvMGazfLCGqNws6yXutOWtuAWktD0gYR2by
         MboA==
X-Forwarded-Encrypted: i=1; AKwUvBxq+4toVjR8oVmAiHc6auigwLWucruac7h2BF47nnGscXvTaOnqGAX1H2mXR3BPBeJrSZ7FDSo=@lists.infradead.org
X-Gm-Message-State: AFuF++mYh8q5mvuYCzoU1YKURDonLMH2nJzNKWZV0PqB+6HVOuHHZ+1l
	7t67Yp2+tfQdC86AbN3H8ZWfEp3XBds5cLKEEqBGP03Nx4z+BUiDJS4IFGToNFmlVdqPy9vtzhm
	wYpsUUMQijSEwz//gAqgcXPU3KmKoJiHjNsgGToX5/D7wNrpf6t/kMlSQm6f9JSAV
X-Gm-Gg: AYBFou1o07Kt34IL0geNiTzqVJy1293L0GfdNXVqSxApJSm27RVVkvqSvzVRU0X0I+g
	LWvc7+YN2m3k8su1E8t0TaY+/QRWeX/Ivr0rRCA9ICu1+f2CoMs0OON9NXDjuVgekdXaCLJsQEf
	DZKYDodqXeeWG5gD4abnTlFaSsvMRuyce3/TkdNFqCnwTL+V8MJXT7YwhI76kr3ceo3a6pFcbN/
	iY+Ohu0E1d9TpAXVuDy+Ry+yjDSJcZ2yE8wKSBL12I2XNZK3uWOYl5aClVF2tpl52wHZ5OgzM/m
	IRZ8unW5GWlQnrAZOwjElHC5JDowtmSyFqH2OADcam0NWWbRpCkOB6j9dmzgCMDY2kTUecxVOpe
	URLCvw3Gzb7oY/Uxk10nQX6a+hWX5YquXq4wS
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr352744a91.23.1789164796294;
        Fri, 11 Sep 2026 15:13:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr352694a91.23.1789164795793;
        Fri, 11 Sep 2026 15:13:15 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm10137893eec.17.2026.09.11.15.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 15:13:15 -0700 (PDT)
Message-ID: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 15:13:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260909
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rFJ3GNiQ8srotY82dltegF_nrpHNpdbS
X-Proofpoint-ORIG-GUID: rFJ3GNiQ8srotY82dltegF_nrpHNpdbS
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6aa47cfd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=rlMSw0Raz3rYzQdK8EQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMxNSBTYWx0ZWRfX26Q2E7VX9kEj
 3piCIRygfB+io9JxmHIEHYsWnLMgRqoeBB124/CXYIlgrEErvkbSK6+9LkBK7S2w/4HnrFqd/DM
 OMBzRbfvZ+S1wUntP350S+PuBlztFGeEvJZpYIxZZMOGvBSi8/YmGvT7ZmpD+blm1pVlLvYoIeq
 mDw/o3fKWB74YJKoUe+wnUOgSu5V00GlcPVtGu9+1aUBKIb5hiNTkTx8qsGu9Du7QBkMCIi3Ioy
 dVkvmjBj3GUw5egOLYViIqYh37AkcvfagqHmawUCYundCAJgYe3ljD5U7gXerFJEF3cL432ACBA
 PwBYg5FvnrJW5YU35rp0avehyvAFt4gLRDaYbl7Kjr8MN7wvqWAB+dFcd3cwJVzQjWIYRpAtpqb
 1DmspcxOojn13WOtNaXi0LA5uTcitW03ivcmcwYMolzZqVZH774aX04DX6sCdttpPpZg09McO5n
 jIzZZsTEFI5+IOlCFJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMxNSBTYWx0ZWRfX+mhXpz78PkQ8
 lOJkmbNDUwQ1dc6psVg32LhwUN6riUy4G33oFr36xa1LVk2zFkEMbx/SSk7kGzOnA6TJUiQI1Ty
 iBFvZ/GEgoaOnHAJac8Aj6jN9wONYX4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151317_645200_976D5E5B 
X-CRM114-Status: GOOD (  11.06  )
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
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath11k or ath12k.
For ath10k add firmware files for the shikra platform using WCN3990.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

  Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260909

for you to fetch changes up to 46c028dc5c8e8a75c70987b9b4388ab6133d1012:

  ath10k: WCN3990: hw1.0: add shikra firmware files (2026-09-09 09:52:41 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990: hw1.0: add shikra firmware files

 WHENCE                                          |   4 +
 ath10k/WCN3990/hw1.0/shikra/firmware-5.bin      | Bin 0 -> 60 bytes
 ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp | 571 ++++++++++++++++++++++++
 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn        | Bin 0 -> 3811820 bytes
 4 files changed, 575 insertions(+)
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/firmware-5.bin
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn

