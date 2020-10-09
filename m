Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQqZM-0001Wp-R8
 for ath11k@lists.infradead.org; Fri, 09 Oct 2020 11:28:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: Enabled MHI device over PCIe
References: <1602160344-19586-1-git-send-email-gokulsri@codeaurora.org>
 <1602160344-19586-4-git-send-email-gokulsri@codeaurora.org>
 <20201008131115.GA23649@linux>
 <7dd959fd2d9375d5529cf52e93aafda3@codeaurora.org>
 <20201009082625.GD23649@linux>
Date: Fri, 09 Oct 2020 14:27:41 +0300
In-Reply-To: <20201009082625.GD23649@linux> (Manivannan Sadhasivam's message
 of "Fri, 9 Oct 2020 13:56:25 +0530")
Message-ID: <87d01r1vwy.fsf@codeaurora.org>
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
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, gokulsri@codeaurora.org, sricharan@codeaurora.org, ath11k@lists.infradead.org

+ ath11k list

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Thu, Oct 08, 2020 at 11:03:42PM +0530, gokulsri@codeaurora.org wrote:
>> On 2020-10-08 18:41, Manivannan Sadhasivam wrote:
>> > Hi,
>> > 
>> > On Thu, Oct 08, 2020 at 06:02:24PM +0530, Gokul Sriram Palanisamy wrote:
>> > > Enabled MHI device support over PCIe and added memory
>> > > reservation required for MHI enabled QCN9000 PCIe card.
>> > > 
>> > > Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>> > > ---
>> > >  arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 47
>> > > ++++++++++++++++++++++++++++++
>> > >  1 file changed, 47 insertions(+)
>> > > 
>> > > diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>> > > b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>> > > index 0827055..e5c1ec0 100644
>> > > --- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>> > > +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>
> [...]
>
>> > > +	pcie0_rp: pcie0_rp {
>> > > +		reg = <0 0 0 0 0>;
>> > > +
>> > > +		status = "ok";
>> > > +		mhi_0: qcom,mhi@0 {
>> > 
>> > MHI doesn't support devicetree as of now so how is this supposed to
>> > work?
>> > Have you tested this series with mainline?
>> > 
>> > Thanks,
>> > Mani
>> > 
>> 
>>  Hi Mani,
>>  This node entries will be consumed by ath11k driver and is not supposed to
>> be consumed by mhi driver.
>>  And yes, it is tested on Mainline.

Upstream ath11k does not yet support QCN9074 so I don't see how this is
tested with mainline ath11k. You must be using some out-of-tree
_unofficial_ ath11k patches.

> Can you please point me to the relevant binding or the code which consumes this
> change?
>
> Also please explain what it does! For enabling MHI support over PCIe you don't
> need this node at all. You just need to define the PCIe device ID in the ath11k
> driver and that's it.
>
> Adding Kalle to this thread...

So currently QCN9074 firmware needs 55 MB of contiguous host memory and
I suspect one reason for these DT entries is an ugly hack to provide
that memory range to the firmware.

We are currently preparing QCN9074 patches for ath11k and finding a
solution how to implement these properly in ath11k. Hopefully there's no
need for hacks like this, we know more once we get the ath11k QCN9074
patches ready. Please drop this patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
