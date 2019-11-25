Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZDWh-0003To-Uc
 for ath11k@lists.infradead.org; Mon, 25 Nov 2019 12:31:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3 00/49] ath11k: driver for Qualcomm IEEE 802.11ax devices
References: <1573810153-29623-1-git-send-email-kvalo@codeaurora.org>
 <0101016e975ec74d-5c7043cf-f7c1-4301-939a-783203f9c80d-000000@us-west-2.amazonses.com>
Date: Mon, 25 Nov 2019 12:31:33 +0000
In-Reply-To: <0101016e975ec74d-5c7043cf-f7c1-4301-939a-783203f9c80d-000000@us-west-2.amazonses.com>
 (Kalle Valo's message of "Sat, 23 Nov 2019 08:26:41 +0000")
Message-ID: <0101016ea28bae26-b7a1765c-d1ec-4eaf-b2c1-5bd3f81c6ec7-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Kalle Valo <kvalo@codeaurora.org> writes:
>
>> ath11k is a new driver for Qualcomm IEEE 802.11ax devices, first
>> supporting only IPQ8074 SoC using the shared memory AHB bus. ath11k
>> uses mac80211 and supports AP, Station and Mesh modes.
>>
>> Even though ath11k has some similar code as with ath10k (especially
>> the WMI layer) it was concluded to be simpler to have a "clean start"
>> for ath11k code base and not try to share the code with ath10k. This
>> makes maintenance easier and avoids major changes in ath10k, which
>> would have significantly increased the risk of regressions in existing
>> setups.
>>
>> Even though the driver is very similar with ath10k but there are major
>> differences as well. The datapath is completely different. ath11k
>> supports multiple MACs, called "soc" in the firmware interface. And
>> there's only one WMI interface to support.
>>
>> Currently ath11k supports only IEEE 802.11ac mode, but patches for
>> 802.11ax are available and they will be submitted after ath11k is
>> accepted to upstream.
>>
>> The firmware images are available from ath11k-firmware repository but
>> they will be also submitted to linux-firmware:
>>
>> https://github.com/kvalo/ath11k-firmware
>
> I also added to the commit log the version which was used in testing:
>
> WLAN.HK.2.1.0.1-00629-QCAHKSWPL_SILICONZ-1
>
>> --------------[cut]-------------------[cut]-----------------
>>
>> I have split the driver into multiple patches for easier review, but
>> the final version will be split into three commits:
>>
>> 1. adding Documentatio/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>>
>> 2. adding drivers/net/wireless/ath/ath11k/ with the commit log being the
>>    text before the cut line above.
>>
>> 3. adding ath11k entry to MAINTAINERS file
>>
>> This version is based on commit ad10d2ff619f0797cb102b2ff488429d3f8e4a8a
>> from ath11k-bringup branch on my ath.git tree:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-bringup
>>
>> This patchset applies to wireless-drivers-next but needs
>> CONFIG_COMPILE_TEST, CONFIG_REMOTEPROC AND CONFIG_QCOM_QMI_HELPERS to
>> be able to compile on x86.
>>
>> Please review and comment.
>
> I have now prepared the three commits and they are in the pending
> branch for build testing:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=20bddf19da715842fe24c8e9990ae1b75825c747
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=461a5c86cfa562bd3c4a8f6bec9a54c406540e87
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=8710785df81b8b57e62a71e9048c111a7db98005
>
> In the next few days I'll apply these to ath-next branch and queue for v5.6.

Manually applied to ath-next branch of my ath.git tree:

dae0978d4174 dt: bindings: net: add qcom,ath11k.yaml
d5c65159f289 ath11k: driver for Qualcomm IEEE 802.11ax devices
02fdd85da2ce MAINTAINERS: add ath11k

Thanks everyone!

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
