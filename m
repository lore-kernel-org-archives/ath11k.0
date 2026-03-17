Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C50FD708D
	for <ath11k@archiver.kernel.org>; Tue, 17 Mar 2026 20:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h8hJpBSymWCOuiDE63BWomIOUCJqxU/ANvolJAkwQik=; b=3uoIQCoZyaPAKkzwIo0HUjWXmN
	8bK9T6u6blmNcri5LLVEmkMRGzPxK62jqIlrp2jdE75h8FxrElfxnuAVFPuWRYMxvm3DAnvGfbv6x
	4BY9nmPlJJ34cYfCxp6gfcT+wD2KEB/qJAJZU3Zsf7w3USx4blhMxthZe1lVaRqqbPlpQWwO23X5V
	fWK31G6UMB3tSyiSCrY05VrTRFX/v3B9/6iQsM6mYfaptMTNRVBOSP+gZo2DL0vfLYcMho+hePCu5
	03W1LWd520GMRJu+8bm8UtNvYW0GMIv+sfIQaPXnwybbjsyBgAbufBYOeJn2vlF7zxGQ/JaDfbuJW
	KTZrFOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2asc-00000007BiH-1kee;
	Tue, 17 Mar 2026 20:19:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2asZ-00000007Bgz-1lmq
	for ath11k@lists.infradead.org;
	Tue, 17 Mar 2026 20:19:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJmsU1261069
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 20:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h8hJpBSymWCOuiDE63BWom
	IOUCJqxU/ANvolJAkwQik=; b=EdJCwjRks+tHuwFj0x7YLeaFL6s704BL1NLgXi
	+zK2X75joPTXfmrSjaOwuTBQWpxBlapLQePhZqqRSRQV9olta15fMpxCzmi7s1Bi
	dbGJbbDP2RHQMbgmFRaatm3ruLLoW/Qtsjn7OGSAgKW5AbP++sLyvOfNpQ3jvrQH
	qGwp9s+cv6a62MjGuO/I+hCvY+lDg4pS2NSQR2OSK/OkTO0GuU1Jd+YcIfShqZX5
	t/ZVOr012PQVgQuqFUR+gN7fjdT+mcBAbqTFDWgjUeqI94PPJXcEpOmHRGFRzm7z
	zyfCv3tY/pfncaikXWIQAWWMmQ8NUN6V/d6TMKHmaxAoVI8g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy5g8j3ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 20:19:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2beabdd96f2so5780658eec.1
        for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773778741; x=1774383541; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8hJpBSymWCOuiDE63BWomIOUCJqxU/ANvolJAkwQik=;
        b=RN1X77MlE6azZ3fZbKN5uh24aL7Z92xc1lrVhfoRjUd7r/XZRauDIZU5Y6ZQMCMghg
         wRePy0kEtaqPpLy6cjxFskkJAKg4IQ6mAFIbKq0er5qbjTirOZXcMcOBuhIB08EoDg9X
         rPxbOB/aFWf9MZSr/F5kJhnPuV8/+IS+bXHabWDj+3RDEDrQwEzja5DuI+8x0IlFOWR2
         JYxrQafOl7rsP+cqpLpkVDOkMlIR5ihlgKGPoZi1pEBd+vL1/FLvPywbrwxGVHIZxsBt
         icyD+iZU2Fy3bOhfZFRGaXXAad++pZbV5kfX5wb6SAnpIOKteplKT3F2vJz8wdNSsqW3
         53eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773778741; x=1774383541;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8hJpBSymWCOuiDE63BWomIOUCJqxU/ANvolJAkwQik=;
        b=SsO61BR6svV3amDWnDCL83XN1P8W1+KLJlnOIiNxTTHfxqt7HMIIjWia7jMdwOaTti
         cnW0bA4Z9wCi1GVkobzWMn6YIyXNEAeZPj/Lkvk5MOGn1DtW6qGxs8XdnSkhbpVJ2lmK
         ZdhNxIxF+Cw8Nq5fc3p0x7ZR1EZ+PUzYxZpc5jIwDTRHjC+kPHRa7JknJ2vu0n6BOI+5
         ESLUTj8Up9rWBu9Dn8aoqez+LIKTLTT9UChBtT0w7gwwAvXj9adFzi/m4Mdj1WdAZUIa
         kcb6VN8kbkzSlQrUWBsjeYDuMLd6uukc2V1qSxeMRpzt6haSQKk2pzghuEc95TakbfSb
         OITA==
X-Forwarded-Encrypted: i=1; AJvYcCXkW47lSU84kkS2HeM3ga8qdyBlpon1VQy5Q8dcVi+57/qAIFnqWIl1och7Unp7uFgxH+2LF1Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxH1/4wMyD5wDKUu+Q6nMyrt+Za5oeer6E9/+9s660qb6WzyUey
	UjUfu3Uq6i/+1LUyqmqGTNOqVDb+1F6c0iAEngHsgjO7Cr1Cl4ZyfkmJo3F3a5S8eSxALqwqwo9
	xCbEUo7pbUIsOd5hfpTAm2n6ULAK6TJ9LBNTX997DO6Qfz8ySHEHWmaJX1utBoVXo
X-Gm-Gg: ATEYQzy3lMn5rh56UhsYfqVHwsf5GWp8xo7O8B1dPwlNIHnOKFuLv/e9Qc+9zV94L5x
	dl/ZE7rr8VwgNSkVRfRm9oAa20p728Ad6d0mbKdXsPGTIlip9FbzexKWD2Xrs6N/kjF6wJrY7eu
	d1JVOQWEPd/B7LxAuAwdSvGkjnqpFpW5ORv1eJxO6nw4K0MMqdHftjUp10nTHXbnLj530a5bFB3
	DyZqizgBLdwl0rG2GGuMfQT4whcWMWRf9J8fKFwvuuEpTrV/TqAyXMWa5h4pqvc5ys3/Lrm4Ywu
	wUEFuogWgv5RWD85+NfEdCNsPZa+nrw9Q3jmCbxnUznGXcOaZjdF0lR7dLasESuqf+RB+Kc1s2k
	fGE3R9sk/f5qoWAgq1WnrHauh2wNTb1/i5Mx3CLMsJnX9TJmfYHNxbzp8hw==
X-Received: by 2002:a05:7300:3724:b0:2be:e4b:60bf with SMTP id 5a478bee46e88-2c0e509772cmr393491eec.10.1773778741092;
        Tue, 17 Mar 2026 13:19:01 -0700 (PDT)
X-Received: by 2002:a05:7300:3724:b0:2be:e4b:60bf with SMTP id 5a478bee46e88-2c0e509772cmr393474eec.10.1773778740510;
        Tue, 17 Mar 2026 13:19:00 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm756534eec.30.2026.03.17.13.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 13:19:00 -0700 (PDT)
Message-ID: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:18:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260317
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lSmmQ9vYMJ_JUdE4PwSz4VXqHtp9ybAQ
X-Authority-Analysis: v=2.4 cv=EeTFgfmC c=1 sm=1 tr=0 ts=69b9b735 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=lm4jLvrnElEPTkshbfUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: lSmmQ9vYMJ_JUdE4PwSz4VXqHtp9ybAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE3OSBTYWx0ZWRfX9HZ6k3WsKWrn
 qTLqxIeooHhZuQtgD4E9kntzlRk1cazWtO4R8f/C5NA22unpDhcC69JkEzLmVKmVVqJTBqJhpe5
 TFBBg9MCBwfxcRemZAQt6y46q8dqV9WaxaEpKtU+SFL2opIU+Rp3vWd/DacdU65ytZtEi19Y/vX
 hMGkpb4oLgqyl9bEXQfoq0QgjRFrcGLwXeB2pCRzOnh8OZTUJybCQKk2c4zxEBS9SRnugiC4sQo
 O+JiBmrcNcRIoPIvEVgvVRucwTPouRGTazkpDX2me3BY5ambGJDFUAWmc/kLvlWW7qlJ9F/WuQs
 +hVIf+zH7nM+ZspAlQFu6dqptJCssIKtrbGp+BawXFkjZaN9VU0M8XuUFw5O1SKL3f4VEk5HmNJ
 Ume5uyIdr5HhXK8ZAn1XTOV05SiPzBdpmWltgu7UJPk4lPyJxoXhMrbjDTrHkdf5/j8314povMh
 +XKO7IeMja3Zr0InnpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_131903_490798_68886A15 
X-CRM114-Status: GOOD (  10.35  )
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

The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:

  Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317

for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)

----------------------------------------------------------------
Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k or ath11k

For ath12k:
Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
and Automotive.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

 WHENCE                        |   2 +-
 ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6090816 bytes
 ath12k/WCN7850/hw2.0/m3.bin   | Bin 299660 -> 299660 bytes
 3 files changed, 1 insertion(+), 1 deletion(-)

