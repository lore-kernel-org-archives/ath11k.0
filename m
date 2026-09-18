Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5918C982DF
	for <ath11k@archiver.kernel.org>; Fri, 18 Sep 2026 14:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=; b=tT4jvls33VHu3NEUZ24Ec0DCLJ
	DO/QThAl+MBB6RMNpzqlncUOOihyGTKMbHjOGyXUGjwQfedyszSuLejifOHRHAViJOLrZHfFbwy9R
	1kqWPs5rkvn0AcjepIZYzdRl/wqM1JWlY3bze4+2tV/cWbF4Donoye8c1U3eJ+bI8dY0Gf1Xo9jVk
	yEgRXCyn1zamcu+hCwk0DcDbWmBkThMEJFjuhpInfB4vzvggSIv7FithJwzqzqD4yM7WnyifczfWQ
	cTlfAwlbwV3VP/D4xBthfNTcsO3Q43w0zGtv5IeJux0Ihq2+onK2KwG+ONxOSnfvRxemCEWTi83Wi
	3iQserhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZRM-0000000Eh7m-1UbH;
	Fri, 18 Sep 2026 14:19:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZRF-0000000Eh5B-1B6A
	for ath11k@lists.infradead.org;
	Fri, 18 Sep 2026 14:19:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDORn53645735
	for <ath11k@lists.infradead.org>; Fri, 18 Sep 2026 14:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UVIKTbOX8P65rHjj6Gpe9j
	HcXhIM+KLdiyQqTjwwzPQ=; b=DobeeqdU60kdMGy3DWDXi/byxGfySY6l20JjUM
	iMDRkWre2xMXVhmLSxpBdCvBMDKYgGsggnLMEd/BrUiY8ed6rD+rYpjL4e9GE7Ko
	Byt32oiN+dqu3SW/hskLiG6vob2vuFnhY6LBVchwAfVg87e4v9Pe2javI6yB7/sk
	DMGiwZMSvka98KyaWIbT/TcFOMKTfNz/Wd6lHw7gyZH1hqkjponf/9Hzr3Du3SZ6
	uHpkTgm/+X+vQlIzNPZdhFpWeASTkfklOqvYvFzaoGN0+MO/Ne5Kh4Z2/1uwoghd
	wOf2d2O6PQLWwzMTqly24/pRUzaSzsP0s8t5aVR/k3kk5ETw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dgx03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 18 Sep 2026 14:19:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso1066803a12.0
        for <ath11k@lists.infradead.org>; Fri, 18 Sep 2026 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789741176; x=1790345976; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=;
        b=F9l6BYGqCCyjMKgV+uvWhxuJY767yd/MVRotN2iXkWXBJyyKwFzonpsU0zhAfj22HG
         76Sb27HyeqUnEGfMUKVoGeJyCb1FSQ9BpFAMUKGPs9tynu5siTH8A/NhaH3EgUHjT/MT
         m6AuPgKCTnNMiOr7SMLritzZ5l7UriN5PntzyDXM0CWeXXCPJfW5GkLlRsvwS8QEY8Mu
         bE7+pspFvyJWBLkU3OYUrwjnN3ApPWGXWDD/BhvYFHENZqdmH2UuNeFILGS/V2U2sxou
         ANNIx4XAGI/SmzXBYUyPznzI66O4yqrHuu5Lp0G/FWU7CBExp4Fi5A6bZhFM7kZi7j9i
         fn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741176; x=1790345976;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=;
        b=OEh7DrS1/uKpEtPXrZDscZJJh7hDbnfpAwyFBIKQGXbUbA0zRARgZR87+cEwy0wLR9
         vla4tZegu6NA0/WuCfV4iaJgF5ARqAw0tn5IR+9LPqn+gQq03nQOQ9vdIUZ9TLzGUeN8
         8H3VTDIhBlUZsKiP3O+47EoXhMZwyouAqqaOm1/S9EEBWI4HrPRoa+eV6BbYEvrNKcZW
         y8EPUVbeI0GWPyOgylOJkjtIin1wBsEhPrtbXBL+EbRRym+wh1wT/A8chLCoxnYTTKCX
         kqHRuQhQpLcyP+V2n9wSGHZR3zWaIBh/JG6pP/mz4A49Pj+FsmG2D9QnF85IDEv2FF38
         4MJg==
X-Forwarded-Encrypted: i=1; AKwUvBzSJ3r0+6OzwZ1ynvVsVvFS+ZOEb3UQdr866KxwLrIAdWnsS+UiLLb2MsVd7vThHMTfpPS826k=@lists.infradead.org
X-Gm-Message-State: AFuF++npAi2fJFZuAaIU/49CORMqT+FhfLzTiDLofzJ1VG5edBJ1N6gc
	NQmS712ndEUHgb/u9CV/29ICuzdB7G2uN2x6xPObHAg1rxG4AwIb7WWFnEnUmB9IqdDhU0OYG77
	IkolU2Z27wr1u7geKKE6YFsLngQMBQtI/OFZDcRmeylG0O5gCSToV2RXUdwdHwgMY
X-Gm-Gg: AYBFou1FijrfvfqyRs6d7UskQLXG59JAZZVEbqQPlTKFOiyYEjQP2im9Xb1/qY+BaTd
	7czOtWS/um39hXsMufM+jrep+2anwNfMC4G7/cyPVgXL3W7HWcmwWJbQl8en+e18u7QKZ1Cl+BH
	xvcc5w7fyeD1J4I61Qrc2A/YErmZ53jRTrUk5mX9U537ubaGGq93sjaOsRRhW43KpH84T2o0gcM
	KgxzBYh9nBFqo60Qmyl8xRHbn77Zy7FbJuSLH3FSHFvJCQXUUsCl+uuCvIVzQSarvrEf0xsjXaL
	RGXrp+1IkC+80fFO96qUpKudiTa2o7dlSjYcQJ9SQgL551Dgx2895AD8tZNsuw6T3F+tbgTVU2A
	CkxwrvqZV3iLO7n3zw5uPua7u7ZZ3OacXayu6
X-Received: by 2002:a05:6a20:eec3:20b0:3dd:a006:ed9a with SMTP id adf61e73a8af0-3dda006ee10mr109623637.48.1789741175735;
        Fri, 18 Sep 2026 07:19:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:eec3:20b0:3dd:a006:ed9a with SMTP id adf61e73a8af0-3dda006ee10mr109582637.48.1789741175140;
        Fri, 18 Sep 2026 07:19:35 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50c821bsm1100001a12.22.2026.09.18.07.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:19:32 -0700 (PDT)
Message-ID: <bb9ea6c5-67ee-402c-a007-46c9c7727632@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 07:19:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org, Troels Vognbjerg <hekatombe@gmail.com>
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260918
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfX+DnCHFbtgeVk
 dxpmj+IsArPSdzlSvRt2FJmyYyai++tYtnATpEWknw6Jn+CDnVBFv/2bVfFpPMICeGhWdGI6iR/
 gxfmLjK3qPcH7+mXDcTJO00MIc3TARk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfX/PzJHuiyna7f
 VovJvJBzSBbJ0y64VNcnmFUVEc/xOn82BH/abaxAx0RryOrgHs3nh+XxPQ0imsslD44/ZTobL9I
 eoaG04/K8gum3wGlwACSQ/3okIYHEGW7ilxykBkCQ2FNy8DcUXOJM/t7zwp4Vqa/XxFzh9KNGuk
 P3Z7P/kl47ZmXkV6mPkYF6/cyXXGt3dG82runLIIFzXpxmi14sI8yXsayCRk2F88dG1snO9PSM5
 v39ek9dowMIupz8WQYy8OtRcQsTCZPZsEqd7q1L3lu5oSi6FB/03N6Fp8tsTQTi8yeDJJplb4Ky
 1puAci5B0SfrW/udQ56nBkyQpH2/E2dfBf2fjTYPSQfjzlL0QroCDsioPmf+PzHtObFDuyKr1w4
 aTcZdi9SaM0McSdBw17wWyQNb7ojuQepXEunWJgdWKXjS/1ronZDmOK0vPVHzwduIrRPTISIf4O
 FrDmN+RxR9QZJTSnwWQ==
X-Proofpoint-GUID: lZ_2IDRepPSKQeD9KyTlonKRfIeoHyqt
X-Proofpoint-ORIG-GUID: lZ_2IDRepPSKQeD9KyTlonKRfIeoHyqt
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad4878 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Q1qRzZT12ma5ygSj1D0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_071944_977886_3A3C1519 
X-CRM114-Status: UNSURE (   9.44  )
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
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath12k.

For ath11k there is a single change that adds four records to the WCN6855
hw2.0 board-2.bin that cover the following devices:

bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=910a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=910a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=940a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=940a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=18,qmi-board-id=255,variant=UX3407Q
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=2,qmi-board-id=255,variant=UX3407Q
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=960a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=960a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=970a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=970a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=980a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=980a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=9f0a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=9f0a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17aa,subsystem-device=930a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17aa,subsystem-device=930a,qmi-chip-id=2,qmi-board-id=255

For the ASUS Zenbook A14 UX3407Q records the following tags apply.

Reported-by: Troels Vognbjerg <hekatombe@gmail.com>
Closes: https://lore.kernel.org/all/CAPMyOuCk7SEhPvcNNQ3ZMUf=uH=e3Pp0NHf6zLoakrSvL4qEoA@mail.gmail.com/
Reported-by: Mohamed N. <private bugzilla e-mail redacted>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221853

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit c9f6fc67b4833a0e4d0aee2554d637c49f997329:

  Merge branch 'eec-eef' into 'main' (2026-09-17 14:57:59 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260918

for you to fetch changes up to f8d2ffa59894c9f8858585eecc968d63aee6f46e:

  ath11k: WCN6855 hw2.0: update board-2.bin (2026-09-18 06:42:58 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath11k: WCN6855 hw2.0: update board-2.bin

 ath11k/WCN6855/hw2.0/board-2.bin | Bin 7237392 -> 7479440 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

