Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61306C5DF6D
	for <ath11k@archiver.kernel.org>; Wed, 19 Aug 2026 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XMrepigsXGmXg7NqGr24NJp0iKyvLFf7rtCvX19jY7Y=; b=acTE3BfYNxPyZu
	9iyI6gBszAdbb+QBfz2vuZl13AEYTZ06eX+xmlPoCSz54eZGaeo+nGGZEcixMC8H5yWkSDwTB7OHV
	Uve3ABvVaMjXHAm7366zkGJBGQrTnpFEFM4QMcuRytQY2jsGqszb8hm4qpVtffUJQEE8zLwykr+z7
	r9qnCVqVfTZlUr26gyDKN4KU1RxJ7VxzZIc/mINTMsG4r9qMOR7LzFgxvQs76WV3shxFit94RVTTu
	OXkYv5p3MtyApt8DTDdr+JQeaItx7lvodStjGDPJOGglJfcjlAe4jT9LiOq3JtMMpH+5aywH9A4Fm
	T80503B4H0g4FwYn+1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJE-00000009rgB-1MJD;
	Wed, 19 Aug 2026 13:26:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJB-00000009rfb-2d3X
	for ath11k@lists.infradead.org;
	Wed, 19 Aug 2026 13:26:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0bWU3600882
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XMrepigsXGmXg7NqGr24NJ
	p0iKyvLFf7rtCvX19jY7Y=; b=hPFqpjNc8wqg9bSHU/lHQu7wOHvu6SkMLRPWzV
	rB7XPMvgZnB93DQPGi0mLaK+tC3SshCdsJ7nCOF5sK0srH1615r837MaZGRVDQEl
	rqiNMQ/SoJ9rIgBbng5YSW8fmv6WsM3I8iIWf6PX2pKcU9DirvMWBjAoy4HvXSW0
	qTAQJY3YrUA7JShUlAncqfeVBM/LzaTmSa0to+db6mTEc1DDockPidhRVXfcoYr/
	ETwxHQVeVVQrSOQOJ51+sLJWg+FFMk49YJo3l9z6pIJBdEo96WHWi6Xgg/TR8aSE
	/FGO+N++RpJzRqpIIOjQR/w8SdvOJb+lJ5edN0vNqwP9Ep0g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3da2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e6d253330so1211824a91.1
        for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145980; x=1787750780; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XMrepigsXGmXg7NqGr24NJp0iKyvLFf7rtCvX19jY7Y=;
        b=gkBEUebF/GE+OhOMFCljZ/cKNuMOpBoWE6xYB2OjnSuUyPbt/AdVuMofAVOiNfCkry
         Dn7dux4ueZf2n4BByYtAaGeTXNFeIaMb7Kghv3ht9B0EpAH5L5CClNhNYJDQzXXmWC/E
         bHNM+WDtsrWaDSAyW2bYVy9tCaVmJhBtOyYtWbEfvkHn/SHYCaxdo6s08Rcr8kMjCRf/
         isP+cVft3qDcdzJ/8/HA4eI4YjyVjp3j+Y9wKe5+H+QBWJLl/HwGMyMqrw1Okm9al847
         KhBSBFjwV9DYx+9hvKI4inWXlHdnNkuIV2jfy9Djg6rLVncsHZ3NlmgWy26E5ddJNfaI
         40PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145980; x=1787750780;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XMrepigsXGmXg7NqGr24NJp0iKyvLFf7rtCvX19jY7Y=;
        b=VpU+dk6pPAk9FJzNsZDQl2vArFEme4goiIk0tkkAUxN/M+73MSKAELlugU+B4HLiIC
         ltgJQ8XvybeLI/Q/b/8q7s6HQY3ghDnANMFSunNJ+AtVIDHOFnGtuXS7VVpEeVLtIiJp
         4AmRa6ul/X3SqK4BeiVo5qICe+YK6wnbGQvLxiOgJMFkcKExN9Xz9bjXM6mSem40Uvv9
         t65OaxMyXE7cA5dE+C7CIp0F9oJkn/c207vYHETiCxSIkz5b+ofiMp9hgEr/evR6+5Tq
         7ghLsXQ1NQ77KeWl0b3PA1Nq0cFL0vPxteiEmmg4w+T7WDX8ajU/DTS+Ow3XbIB/JkzH
         OrmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqbju+Qsd577uU+0zdeae5kvnr22On3PEGfkK3gGwNmwqNFFUioW7MCaJJuKPRalq5JBb5/Nos=@lists.infradead.org
X-Gm-Message-State: AFuF++mRRoKpy93JdK5ny+veb6xmKsMsiJ8i63ZutrbVnXr65VTVLbnG
	vmFg3wfXbOQ4WoJXymB213sIJqHFUAURcCRV9kEqusqPZCo2gUWQTHFaq1b5hbLzSOWwl8JOUGL
	ZWrE7hEfcXthocQfWuttchofEBTggXssmNt8bOZ+M6PK1J7KFhQ7e6Cb0WLmB4XRp
X-Gm-Gg: AR+sD10jSjl8nYVHuVu9mMzXgafaXF5BQCgATi2+gcUuYQd/X8FrAariwghP4n/ZpSu
	9SYI23EkyUhtupldaq8Xn7giR6kCwztj2o/bFe49q8WE+dc6xi/5Pan+HkIp5kuLddkwmIs71aD
	q5cwdZm4Zj+FrnkHZE4JmyAnQPtnPS8bJCL3XbCGK2enb2Wh1xFNgByx5/P1ltfM5dmoN06Cu8I
	G4UgvlhM9epeSnMxTzC7K9RupJakX3yYKRz62O3k8NxKzSR1Nj26V0HpXolsQoGdTh8z9EMjMRP
	q0kcrUvU5dXjEDgi1LCzcF0jhtM4krLDIp+S+3PCm/k6/J5WzIScnsc5EZvEIxXGpA+b/bLTeoL
	eXpB6FnRXAlQbjLzRsgWPCn0v+9sQoPuA7Ho=
X-Received: by 2002:a17:90b:3c48:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-3957f997592mr6527344a91.12.1787145979832;
        Wed, 19 Aug 2026 06:26:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3c48:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-3957f997592mr6527260a91.12.1787145979275;
        Wed, 19 Aug 2026 06:26:19 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:18 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v5 0/6] bus: mhi: host: Add support for mhi bus bw
Date: Wed, 19 Aug 2026 18:55:51 +0530
Message-Id: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOGuhWoC/2WNS47CMBBErxJ5TUf+xHbIinsghBzTYTzkhzsJj
 BB3HxPYsWmp1K9ePRhhDEisyh4s4hIoDH0KepMx/+P6M0I4pcwkl4aXQkF9I+9ahEIpu+XaGeE
 0S/QYsQn31bQ/vDPN9S/66VX/EBGvc5qY3hjrkMitE1W2DlhewugDOBo7SDpYFHAw9cnKQgtbG
 NxdMPbY5kM8v5xfhkIImMgfp5Bef72HRYIA00jdWLktba12A1F+nV3rh67L02GH5/MfhXN2YQg
 BAAA=
X-Change-ID: 20260813-bwscale-4337905a61a5
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Krishna Chaitanya Chundru <krishnac@codeaurora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=7237;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=CmlPJHuzWPOytQEU5R5xQXPPaYc5Od4DQGLS8DUdrmg=;
 b=IJxhu7pLw2mKP1XbVqcRUrzhCr1uryRh3FKy4Ee2feSSbQoUlKwQim294R7215++m+Y/5gEGG
 0NRNSqIBQg4CoMZ517bgdkMMX+Sx5kH5f3yPfdGu9I8w5P0mjtUYb0R
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: tpgrn4UXs3b1KM_QD8cIgaEiCV12Gs5H
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a85aefc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=NufY4J3AAAAA:8 a=JfrnYn6hAAAA:8
 a=gbihCOOLvAovBIVTQvYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=TPcZfFuj8SYsoCJAFAiX:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: tpgrn4UXs3b1KM_QD8cIgaEiCV12Gs5H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX+AggaKRqzDK2
 lQT71JA7YQTjZVq6zircd1AkT+sGNUFuidyQBR2MS9CsOyRvVyvFAxlh/D3z778zk76BkpJ4Qml
 M6vWsokgWmYyu33iDa6OQD21WwEFpzooJmUD4RHZjVsa/UWSt0MU596UMjQU9khYnTevIC/LZPB
 mb5nOw0xYH2lCZSoBt9j+f7wJmEc39etJo3wYkU+LWb55U6QrAiMKiKn+LjgaNRGhO0ncH5sAXJ
 KKicvnJjGlVJ8TuIMoKInm/MfuwwIlsI6jrAiabGaDfqGOj5aao0p+CkCIjQWlVWtwQrshhvzIu
 2CV3ubzZsAO2DeNdJU8W7kgUv6Sm7ZxMUgPWofDdLlCOrxSf2F3x9njoW8Kmm+JChSmPeKV4VOl
 oq1eb1L12Fjbis37qFSR4biF4q7jc5PX5zX9GpwY21HPukz+oVufSczvvaMkZUlujsqIa6472sx
 tQUJ1x7g+woCn97wQSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfXykyIdqdGN3ix
 eyETeFZVUapducP7d2aSQ8YpvHi7PztXDdzHXCPZzO11X6mCl/uzx+MPyahxbANQOk1zTQ5K+Bc
 VRXEItzSuAw2XIWxE+mZ53dtNT37FUg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_062621_691225_2CD9E11E 
X-CRM114-Status: GOOD (  24.01  )
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

As per MHI spec sec 14, MHI supports bandwidth scaling to reduce power
consumption. MHI bandwidth scaling is advertised in devices that contain
the bandwidth scaling capability registers. If enabled, the device
aggregates bandwidth requirements and sends them to the host in the form
of an event. After the host performs the bandwidth switch, it sends an
acknowledgment by ringing a doorbell.

if the host supports bandwidth scaling events, then it must set
BW_CFG.ENABLED bit, set BW_CFG.DB_CHAN_ID to the channel ID to the
doorbell that will be used by the host to communicate the bandwidth
scaling status and BW_CFG.ER_INDEX to the index for the event ring
to which the device should send bandwidth scaling request in the
bandwidth scaling capability register.

As part of mmio init check if the bw scale capability is present or not,
if present advertise host supports bw scale by setting all the required
fields.

MHI layer will only forward the bw scaling request to the controller
driver, it is responsibility of the controller driver to do actual bw
scaling and then pass status to the MHI. MHI will response back to the
device based up on the status of the bw scale received.

Add a new get_misc_doorbell() to get doorbell for misc capabilities to
use the doorbell with mhi events like MHI BW scale etc.

Use workqueue & mutex for the bw scale events as the pci_set_target_speed()
which will called by the mhi controller driver can sleep.

This series depends on the PCI/ASPM patches[1] that are currently under review
and not yet merged upstream. The ASPM patches provide the infrastructure
(disable_aspm_for_retrain flag and related functionality) that this MHI bandwidth
scaling series builds upon. While the ASPM patches are still being reviewed, we
are sending this series now to enable early review and feedback on the MHI
bandwidth scaling implementation. Once the ASPM patches are merged, this series
can be applied on top without any conflicts.

This series also depends on the mhi read capability patch[2], this patch
is not merged as there is no user to use it, we can apply it along with
this series.

To: Bjorn Helgaas <bhelgaas@google.com>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
To: Jingoo Han <jingoohan1@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kw@linux.com>
To: Rob Herring <robh@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: mhi@lists.linux.dev
Cc: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Cc: qiang.yu@oss.qualcomm.com

Link [1]: https://lore.kernel.org/all/20260708-pci-aspm-fix-v3-0-6bd72451746e@kernel.org/ 
Link [2]: https://lore.kernel.org/all/20260411-tsc_timesync-v2-1-6f25f72987b3@oss.qualcomm.com/#t

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v5:
- remove pre/post_link_speed_change (Bjorn)
- Use opp directly in pci directly to scale bw votes (Mani).
- Use disable aspm on link retrain field in host bridge (Mani).
- In case bw scale failure, remove workqueue etc (Mani).
- couple of nits in mhi & pci (Mani).
- Link to v4: https://lore.kernel.org/r/20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com

Changes in v4:
- Remove leftover type case, change the function names to pre/post_link_speed_change(Ilpo Järvinen)
- Add check's for capability read and convert le32 to cpu (Jeffrey Hugo)
- Add macros for GENMASK & BIT() (Ilpo Järvinen)
- Link to v3: https://lore.kernel.org/r/20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com

Changes in v3:
- Move update speed logic to pwrctrl driver (Mani)
- Move pre_bus_bw & post_bus_bw to bridge as these are bridge driver specific ops,
it feels to me we need to add these in the host bridge driver similar to recently
added one reset_slot.
- Remove dwc level wrapper (Mani)
- Enable ASPM only if they are enabled already (Mani)
- Change the name of mhi_get_capability_offset to mhi_find_capability() (Bjorn)
- Fix comments in the code, subjects etc (Mani & Bjorn)
- Link to v2: https://lore.kernel.org/r/20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com

Changes in v2:
- Update the comments.
- Split the icc bw patch as sepertate one (Bjorn)
- update the aspm disablement comment (Bjorn)
- Use FIELD_GET & FIELD_PREP instead of hard macros and couple of nits
  suggested by (Ilpo Järvinen)
- Create a new function to change lnkcntrl2speed to enum pci_bus_speed (Jeff)
- Link to v1: https://lore.kernel.org/r/20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com

---
Krishna Chaitanya Chundru (5):
      PCI/bwctrl: Set host bridge OPP and optionally disable ASPM around link retraining
      PCI: Export pci_set_target_speed()
      PCI: Add pci_lnkctl2_bus_speed() to convert lnkctl2speed to pci_bus_speed
      bus: mhi: host: Add support for Bandwidth scale
      PCI: qcom: Enable ASPM disabling during link retraining

Miaoqing Pan (1):
      wifi: ath11k: Add support for MHI bandwidth scaling

 drivers/bus/mhi/common.h               |  13 ++++
 drivers/bus/mhi/host/init.c            |  93 +++++++++++++++++++++++++--
 drivers/bus/mhi/host/internal.h        |   6 +-
 drivers/bus/mhi/host/main.c            | 113 ++++++++++++++++++++++++++++++++-
 drivers/bus/mhi/host/pm.c              |  10 ++-
 drivers/bus/mhi/host/trace.h           |   7 ++
 drivers/net/wireless/ath/ath11k/mhi.c  |  38 +++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c |   2 +
 drivers/pci/pci.c                      |  15 +++++
 drivers/pci/pcie/bwctrl.c              |  64 ++++++++++++++++++-
 include/linux/mhi.h                    |  13 ++++
 include/linux/pci.h                    |   2 +
 12 files changed, 367 insertions(+), 9 deletions(-)
---
base-commit: f0ffb179a512e7be964f75b00202ad411cbfb0f3
change-id: 20260813-bwscale-4337905a61a5
prerequisite-message-id: 20260708-pci-aspm-fix-v3-0-6bd72451746e@kernel.org
prerequisite-patch-id: 88006da4a3c4d94facb6ff3cb8e47269fb3e5636
prerequisite-patch-id: e9132f8e053568f4259ae33a5f0dfa7d14f6bb43
prerequisite-patch-id: 034cbc5c4004f7384122e454edaf10118495bb1c
prerequisite-patch-id: 3f415cab42569c0fd8d88d3de9775a57b719f82e
prerequisite-patch-id: ba94f33f11b19e08820dee482209dd1ba0d57523
prerequisite-patch-id: 060f698bfdb0e16c64735abd90e21f699f975ece
prerequisite-patch-id: 0451e6b0527b17f006d6649158abef8ae9010170
prerequisite-patch-id: c7e7e403930415790a6075778b9c4851629f54d5
prerequisite-message-id: 20260411-tsc_timesync-v2-1-6f25f72987b3@oss.qualcomm.com
prerequisite-patch-id: 898bad65110d5bb8a51ebadebc00d21b0c0eddee
prerequisite-patch-id: 927a45a5a418489c14481413149cd37840019354
prerequisite-patch-id: 927b714345dfaeecc74ab17645bd73c62a0ed51d
prerequisite-patch-id: 607cbbae4ab145955ba10db4c0eb2ec507c476c2
prerequisite-patch-id: 3eeed070306fd8e1dd9a2edc11eaa91ea3cc9115
prerequisite-patch-id: 77a89f3deee3b2a415c008fa533f3faab7e709ad

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


